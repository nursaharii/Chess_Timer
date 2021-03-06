//
//  TimerViewController.swift
//  Chess_Timer
//
//  Created by Nurşah on 1.01.2022.
//

import UIKit

class TimerViewController: UIViewController {

    @IBOutlet weak var stopBtn: UIButton!
    @IBOutlet weak var pauseBtn: UIButton!
    @IBOutlet weak var btnWhite: UIButton!
    @IBOutlet weak var BtnBlack: UIButton!
    var blckdk = 30, whitedk = 30, whitesn = 2, blcksn = 2
    var timerblack = Timer() , timerwhite = Timer()
    var control = 1 , sayacblck = 0, sayacwhite = 0
    var randCol = UIColor(red: .random(in: 0 ..< 1), green: .random(in: 0 ..< 1), blue: .random(in: 0 ..< 1), alpha: .random(in: 0...1))
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        blckdk = 30
        whitedk = 30
        whitesn = 0
        blcksn = 0
        control = 1
        sayacblck = 0
        sayacwhite = 0
        BtnBlack.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        btnWhite.titleLabel?.font = UIFont.boldSystemFont(ofSize: 40)
        BtnBlack.titleLabel?.font = UIFont.boldSystemFont(ofSize: 40)
        pauseBtn.setImage(UIImage(systemName: "pause.fill"), for: UIControl.State.normal)
        if control == 1 {
            timerwhite = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(TimerWhite), userInfo: nil, repeats: true)
        }
        else {
            timerblack = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(TimerBlack), userInfo: nil, repeats: true)
        }
        pauseBtn.tintColor = randCol
        stopBtn.tintColor = randCol
    }

   
    @IBAction func BtnBlack(_ sender: Any) {
        
        sayacblck += 1
        if sayacblck == 1 && sayacwhite != 0{
            self.sayacwhite = 0
            self.timerblack.invalidate()
                if pauseBtn.currentImage == UIImage(systemName: "play.fill") {
                    self.pauseBtn.setImage(UIImage(systemName: "pause.fill"), for: UIControl.State.normal)
                }
                self.control = 1
                self.timerwhite = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(TimerWhite), userInfo: nil, repeats: true)
        }
       
 
    }
    
    @IBAction func btnWhite(_ sender: Any) {
            sayacwhite += 1
            if sayacwhite == 1{
                self.sayacblck = 0
                self.timerwhite.invalidate()
                if pauseBtn.currentImage == UIImage(systemName: "play.fill") {
                    pauseBtn.setImage(UIImage(systemName: "pause.fill"), for: UIControl.State.normal)
                }
                self.control = 0
                self.timerblack = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(TimerBlack), userInfo: nil, repeats: true)
                
            }

    }
    
    @objc func TimerBlack() {
        if blckdk < 0 {
            Alert(title: "Hata!", message:"Süreniz bitmiştir.")
            timerblack.invalidate()
            
        }
        else {
            if(blcksn == 0) {
                blcksn = 59
                blckdk -= 1
                BtnBlack.setTitle("\(blckdk):" + String(format: "%02d", blcksn), for: .normal)
               // BtnBlack.setTitleColor(UIColor.white, for: .normal)
               // BtnBlack.titleLabel?.font = UIFont.boldSystemFont(ofSize: 40)
                    
            }
            else {
                blcksn -= 1
                BtnBlack.setTitle("\(blckdk):" + String(format: "%02d", blcksn), for: .normal)
               // BtnBlack.setTitleColor(UIColor.white, for: .normal)
                if blckdk == 0 && blcksn == 0 {
                    self.Alert(title: "OYUN BİTTİ", message: "KAZANAN BEYAZ TARAF")
                    timerblack.invalidate()
                    whitedk = 0
                    whitesn = 0
                }
            }
        }
        
    }
    
    @objc func TimerWhite() {
        if whitedk < 0 {
            Alert(title: "Hata!", message:"Süreniz bitmiştir.")
            timerwhite.invalidate()
        }
        else {
            if(whitesn == 0) {
                whitesn = 59
                whitedk -= 1
                btnWhite.setTitle("\(whitedk):" + String(format: "%02d", whitesn), for: .normal)
                //btnWhite.titleLabel?.font = UIFont.boldSystemFont(ofSize: 40)
                
            }
            else {
                whitesn -= 1
                btnWhite.setTitle("\(whitedk):" + String(format: "%02d", whitesn), for: .normal)
                
                if whitedk == 0 && whitesn == 0 {
                    self.Alert(title: "OYUN BİTTİ", message: "KAZANAN SİYAH TARAF")
                    timerwhite.invalidate()
                    blcksn = 0
                    blckdk = 0
                }
            }
        }
        
    }
    
    @IBAction func pause(_ sender: Any) {
        if pauseBtn.currentImage == UIImage(systemName: "play.fill") {
            pauseBtn.setImage(UIImage(systemName: "pause.fill"), for: UIControl.State.normal)
            if control == 1 {
                timerwhite = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(TimerWhite), userInfo: nil, repeats: true)
            }
            else {
                timerblack = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(TimerBlack), userInfo: nil, repeats: true)
            }
        }
        else {
            pauseBtn.setImage(UIImage(systemName: "play.fill"), for: UIControl.State.normal)
            timerblack.invalidate()
            timerwhite.invalidate()
        }
        
    }
    
    
    @IBAction func stopBtn(_ sender: Any) {
        timerblack.invalidate()
        timerwhite.invalidate()
        whitesn = 0
        blcksn = 0
        whitedk = 30
        blckdk = 30
        btnWhite.setTitle("\(whitedk):" + String(format: "%02d", whitesn), for: .normal)
       // btnWhite.titleLabel?.font = UIFont.boldSystemFont(ofSize: 40)
        BtnBlack.setTitle("\(blckdk):" + String(format: "%02d", blcksn), for: .normal)
     //   BtnBlack.titleLabel?.font = UIFont.boldSystemFont(ofSize: 40)
    }
    
    func Alert(title: String,message: String) {
            let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
            let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
            let retryButton = UIAlertAction(title: "Retry", style: UIAlertAction.Style.default) { action in
                            self.retry()
            }
            alert.addAction(retryButton)
            alert.addAction(okButton)
            self.present(alert, animated: true, completion: nil)
            
                
            
        }
        func retry(){
                viewWillAppear(true)
            }
}
