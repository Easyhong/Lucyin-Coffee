//
//  HeaderMaskLayer.swift
//  luckincoffee
//
//  Created by taozhang on 2020/5/1.
//  Copyright © 2020 Easyhong. All rights reserved.
//

import UIKit

/**
 顶部背景蒙板
 */
class HeaderMaskLayer: CALayer {
    
    override init() {
        super.init()
        initCommandMaskLayer()
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func initCommandMaskLayer() {
        let layer1 = CALayer()
        layer1.frame = CGRect(x: 30, y: 6, width: 120, height: 120)
        layer1.backgroundColor = UIColor(red: 88 / 255.0, green: 87 / 255.0, blue: 162 / 255.0, alpha: 1.0).cgColor
        self.addSublayer(layer1)
        layer1.drawArc(radius: 60)
               
        let layer2 = CALayer()
        layer2.frame = CGRect(x: -10, y: 200, width: 40, height: 40)
        layer2.backgroundColor = UIColor(red: 78 / 255.0, green: 77 / 255.0, blue: 152 / 255.0, alpha: 1.0).cgColor
        self.addSublayer(layer2)
        layer2.drawArc(radius: 20)
             
        let layer3 = CALayer()
        layer3.frame = CGRect(x: screenWidth - 60, y: 170, width: 80, height: 80)
        layer3.backgroundColor = UIColor(red: 78 / 255.0, green: 77 / 255.0, blue: 152 / 255.0, alpha: 1.0).cgColor
        self.addSublayer(layer3)
        layer3.drawArc(radius: 40)
             
        let layer4 = CALayer()
        layer4.frame = CGRect(x: screenWidth - 170, y: -40, width: 90, height: 90)
        layer4.backgroundColor = UIColor(red: 78 / 255.0, green: 77 / 255.0, blue: 152 / 255.0, alpha: 1.0).cgColor
        layer4.masksToBounds = false
        layer4.contentsScale = UIScreen.main.scale
        layer4.zPosition = -999
        self.addSublayer(layer4)
        layer4.drawArc(radius: 45)
    }

}
