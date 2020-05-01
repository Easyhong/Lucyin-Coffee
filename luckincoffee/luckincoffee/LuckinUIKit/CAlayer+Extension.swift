//
//  CAlayer+Extension.swift
//  luckincoffee
//
//  Created by taozhang on 2020/4/30.
//  Copyright © 2020 Easyhong. All rights reserved.
//

import Foundation
import UIKit

// 圆角类型
enum Circular {
    case top
    case bottom
    case leading
    case trailing
}

extension CALayer {
    
    /**
     画圆
     */
   func drawArc(radius: CGFloat) {
                let path = UIBezierPath(arcCenter: CGPoint(x: self.bounds.width / 2,
                                                           y: self.bounds.height / 2),
                                        radius: radius,
                                        startAngle: 0,
                                        endAngle: 2 * CGFloat(Double.pi),
                                        clockwise: true)
                let shapeLayer = CAShapeLayer()
                shapeLayer.path = path.cgPath
                shapeLayer.lineCap = CAShapeLayerLineCap.round
                self.mask = shapeLayer
      }
    
    func drawUnicornous(cornerRadiiWidth: CGFloat) {
           // 线的路径
           // 此方法可以用来对多个角进行圆角切
           let path = UIBezierPath(roundedRect: self.bounds,
                                   byRoundingCorners: UIRectCorner(rawValue: UIRectCorner.RawValue(UInt8(UIRectCorner.topLeft.rawValue) | UInt8(UIRectCorner.bottomRight.rawValue))) ,
                                   cornerRadii: CGSize(width: cornerRadiiWidth, height: 0))
          
           let layer = CAShapeLayer()
           layer.lineWidth = 1
           layer.strokeColor = UIColor.green.cgColor
           layer.path = path.cgPath
           layer.mask = layer
       }
    
    
    func drawRipple(center: CGPoint,
                   radius: CGFloat,
                   position: CGPoint) {
    
        let path = UIBezierPath()
        path.addArc(withCenter: center,
                      radius: radius,
                      startAngle: 0,
                      endAngle: CGFloat(Double.pi) * 2,
                      clockwise: true)
    
          let rippleShapeLayer           = CAShapeLayer()
          rippleShapeLayer.contentsScale = UIScreen.main.scale
          rippleShapeLayer.position      = position
          rippleShapeLayer.bounds        = CGRect(origin: .zero,
                                                  size: CGSize(width: bounds.width,
                                                               height: bounds.height))
          rippleShapeLayer.anchorPoint   = CGPoint(x: 0.5, y: 0.5)
          rippleShapeLayer.fillColor     = UIColor(white: 1.0, alpha: 0.25).cgColor
          rippleShapeLayer.strokeColor   = UIColor.clear.cgColor
          rippleShapeLayer.lineWidth     = 0.5
          rippleShapeLayer.opacity       = 0.3
          rippleShapeLayer.path          = path.cgPath
          rippleShapeLayer.zPosition     = -999
      }

}


// 此方法可以用来对单个角进行圆角切
   //   let path = UIBezierPath.init(roundedRect: view.bounds, byRoundingCorners: UIRectCorner.bottomLeft, cornerRadii: CGSize(width: 10, height: 0))
