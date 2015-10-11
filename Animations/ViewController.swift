//
//  ViewController.swift
//  Animations
//
//  Created by Nicolas Dubus on 2015-10-08.
//  Copyright © 2015 WorldDubination. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var alienImage: UIImageView!
    
    var counter = 1;
    @IBOutlet weak var buttonText: UIButton!
    var timer = NSTimer()
    var isAnimating = true
    
    @IBAction func updateImage(sender: AnyObject) {
        if isAnimating {
            timer.invalidate()
            buttonText.setTitle("Start Animation", forState: .Normal)
        } else {
            timer = NSTimer.scheduledTimerWithTimeInterval(0.15, target: self, selector: Selector("doAnimation"), userInfo: nil, repeats: true)
            buttonText.setTitle("Stop Animation", forState: .Normal)        }
        
        isAnimating = !isAnimating
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if (isAnimating) {
            timer = NSTimer.scheduledTimerWithTimeInterval(0.15, target: self, selector: Selector("doAnimation"), userInfo: nil, repeats: true)
        }
    }
    
    func doAnimation() {
        alienImage.image = UIImage(named: "frame"
            + String(((counter % 6) + 1))
            + ".png")
        
        counter++
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
        
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
            alienImage.alpha = 0
    }
    
    override func viewDidAppear(animated: Bool) {
        
        UIView.animateWithDuration(1, animations: { () -> Void in
            
            self.alienImage.alpha = 1
        })
    }
}

