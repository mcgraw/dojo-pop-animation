//
//  XMCAlphaPartyViewController.swift
//  dojo-pop-animation
//
//  Created by David McGraw on 1/14/15.
//  Copyright (c) 2015 David McGraw. All rights reserved.
//

import UIKit

class XMCAlphaPartyViewController: UIViewController {

    @IBOutlet weak var ballView: UIView!
    @IBOutlet weak var ballCenterYConstraint: NSLayoutConstraint!
    
    var bounciness: CGFloat = 8.0
    var atTop = false
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        layoutPartyObjects()
    }
    
    @IBAction func valueSlideChanged(sender: AnyObject) {
        let slider = sender as UISlider
        bounciness = CGFloat(slider.value)
    }
    
    // MARK: Initialize
    
    func layoutPartyObjects() {
        let width = view.bounds.width
        let height = view.bounds.height
        
        var countX: Int = Int(width / 80)
        var countY: Int = Int((height - 64) / 80)
        
        println("x \(countX) and y \(countY)")
        
        var startX = CGFloat(0.0)
        var startY = CGFloat(64.0)
        for var y = 0; y < countY; y++ {
            for var x = 0; x < countX; x++ {
                let item = UIView(frame: CGRectMake(startX, startY, 80, 80))
                item.layer.cornerRadius = 40
                item.layer.shouldRasterize = true
                item.backgroundColor = randomColor()
                item.pop_addAnimation(basicAnimation(), forKey: "color")
                view.addSubview(item)
                
                if x % 2 == 1 {
                    item.pop_addAnimation(alphaAnimation(), forKey: "alpha")
                }
                
                startX += 90
            }
            
            startX = 0
            startY += 90
        }
    }
    
    func randomColor() -> UIColor {
        let hue: CGFloat = CGFloat(drand48())
        let sat: CGFloat = CGFloat(drand48())
        let bright: CGFloat = CGFloat(drand48())
        return UIColor(hue: hue, saturation: sat, brightness: bright, alpha: 1.0)
    }
    
    func basicAnimation() -> POPBasicAnimation {
        let basic = POPBasicAnimation(propertyNamed: kPOPViewBackgroundColor)
        basic.toValue = randomColor()
        basic.repeatForever = true
        basic.autoreverses = true
        return basic
    }
    
    func alphaAnimation() -> POPBasicAnimation {
        let basic = POPBasicAnimation(propertyNamed: kPOPViewAlpha)
        basic.toValue = 0.0
        basic.repeatForever = true
        basic.autoreverses = true
        basic.duration = 2.4
        return basic
    }
}

