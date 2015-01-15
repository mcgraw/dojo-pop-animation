//
//  XMCSpringViewController.swift
//  dojo-pop-animation
//
//  Created by David McGraw on 1/14/15.
//  Copyright (c) 2015 David McGraw. All rights reserved.
//

import UIKit

class XMCSpringViewController: UIViewController {

    @IBOutlet weak var ballView: UIView!
    @IBOutlet weak var ballCenterYConstraint: NSLayoutConstraint!
    
    var bounciness: CGFloat = 8.0
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
        if atTop {
            animateBottom()
        } else {
            animateTop()
        }
        atTop = !atTop
    }
    

    @IBAction func valueSlideChanged(sender: AnyObject) {
        let slider = sender as UISlider
        bounciness = CGFloat(slider.value)
    }
    
    func animateTop() {
        let spring = POPSpringAnimation(propertyNamed: kPOPLayoutConstraintConstant)
        spring.toValue = 200
        spring.springBounciness = bounciness
        spring.springSpeed = 8
        ballCenterYConstraint.pop_addAnimation(spring, forKey: "moveUp")
    }
    
    func animateBottom() {
        let spring = POPSpringAnimation(propertyNamed: kPOPLayoutConstraintConstant)
        spring.toValue = -200
        spring.springBounciness = bounciness
        spring.springSpeed = 8
        ballCenterYConstraint.pop_addAnimation(spring, forKey: "moveDown")
    }
}

