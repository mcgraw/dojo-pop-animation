//
//  XMCSpringScaleViewController.swift
//  dojo-pop-animation
//
//  Created by David McGraw on 1/14/15.
//  Copyright (c) 2015 David McGraw. All rights reserved.
//

import UIKit

class XMCSpringScaleViewController: UIViewController {

    @IBOutlet weak var ballView: UIView!
    @IBOutlet weak var ballCenterYConstraint: NSLayoutConstraint!
    
    var bounciness: CGFloat = 16.0
    var atTop = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ballView.layer.cornerRadius = ballView.frame.size.width/2
        ballView.layer.masksToBounds = true
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    @IBAction func toggleActionPressed(sender: AnyObject) {
        animateScale()
    }
    
    @IBAction func valueSlideChanged(sender: AnyObject) {
        let slider = sender as UISlider
        bounciness = CGFloat(slider.value)
    }
    
    func animateScale() {
        let spring = POPSpringAnimation(propertyNamed: kPOPLayerScaleXY)
        spring.toValue = NSValue(CGPoint: CGPointMake(1.8, 1.8))
        spring.springBounciness = bounciness
        spring.springSpeed = 8
        spring.completionBlock = { (anim: POPAnimation!, done: Bool) in
            let spring = POPSpringAnimation(propertyNamed: kPOPLayerScaleXY)
            spring.toValue = NSValue(CGPoint: CGPointMake(1.0, 1.0))
            spring.springBounciness = self.bounciness
            self.ballView.layer.pop_addAnimation(spring, forKey: "restore")
        }
        ballView.layer.pop_addAnimation(spring, forKey: "moveUp")
    }
}

