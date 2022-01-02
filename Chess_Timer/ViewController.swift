//
//  ViewController.swift
//  Chess_Timer
//
//  Created by Nurşah on 1.01.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        animateButton(tintCol: UIColor(red: .random(in: 0 ..< 1), green: .random(in: 0 ..< 1), blue: .random(in: 0 ..< 1), alpha: .random(in: 0...1)))
        
    }
  
    @IBAction func Btn(_ sender: Any) {
        performSegue(withIdentifier: "toTimerVC", sender: nil)
    }
    func animateButton(tintCol : UIColor) {
        self.btn.tintColor = tintCol
        btn.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        
        UIView.animate(withDuration: 2, delay: 0,
        usingSpringWithDamping: CGFloat(0.2),
        initialSpringVelocity: CGFloat(6.0), options: .allowUserInteraction,
        animations: {
            self.btn.transform = .identity
            
          },
          completion: { finished in
            self.animateButton(tintCol: UIColor(red: .random(in: 0 ..< 1), green: .random(in: 0 ..< 1), blue: .random(in: 0 ..< 1), alpha: .random(in: 0...1)))
          }
        )
      }
}

