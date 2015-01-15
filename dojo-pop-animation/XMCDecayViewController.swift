//
//  XMCDecayViewController.swift
//  dojo-pop-animation
//
//  Created by David McGraw on 1/14/15.
//  Copyright (c) 2015 David McGraw. All rights reserved.
//

import UIKit

class XMCDecayViewController: UIViewController {

    @IBOutlet weak var leftBall: UIView!
    @IBOutlet weak var rightBall: UIView!
    
    @IBOutlet weak var leftBallCenterY: NSLayoutConstraint!  // 160 default
    @IBOutlet weak var rightBallCenterY: NSLayoutConstraint! // 160 default
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        leftBall.layer.cornerRadius = leftBall.frame.size.width/2
        leftBall.layer.masksToBounds = true
        
        rightBall.layer.cornerRadius = leftBall.frame.size.width/2
        rightBall.layer.masksToBounds = true
    }
    
    @IBAction func toggleActionPressed(sender: AnyObject) {
        beginAnimation()
    }
    
    func beginAnimation() {
        resetConstraints()
        animateLeft()
        animateRight()
    }
    
    func animateLeft() {
        let spring = POPSpringAnimation(propertyNamed: kPOPLayoutConstraintConstant)
        spring.toValue = -160
        spring.springBounciness = 14
        spring.springSpeed = 8
        leftBallCenterY.pop_addAnimation(spring, forKey: "moveLeft")
    }
    
    func animateRight() {
        let spring = POPDecayAnimation(propertyNamed: kPOPLayoutConstraintConstant)
        spring.velocity = NSValue(CGPoint: CGPointMake(-642, 0))
        rightBallCenterY.pop_addAnimation(spring, forKey: "moveRight")
    }
    
    func resetConstraints() {
        leftBallCenterY.constant = 160
        rightBallCenterY.constant = 160
    }
}

