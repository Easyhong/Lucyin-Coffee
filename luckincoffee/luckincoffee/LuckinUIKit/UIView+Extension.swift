//
//  UIView+Extension.swift
//  luckincoffee
//
//  Created by taozhang on 2020/4/30.
//  Copyright © 2020 Easyhong. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    // nib名字
    public static var nibName: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
       
       /**
        从xib创建View
        
        */
    public class func createFromXib<T: UIView>() -> T? {
        if let view = Bundle.main.loadNibNamed(nibName, owner: nil, options: nil)?.last as? T {
            return view
        }
        return nil
    }
    
}

extension UIView {
    
    func fillInSuperView(left: CGFloat = 0,
                            top: CGFloat = 0,
                            right: CGFloat = 0,
                            bottom: CGFloat = 0) {
           translatesAutoresizingMaskIntoConstraints = false
           superview?.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(l)-[v]-(r)-|",
                                                                    options: .directionLeadingToTrailing,
                                                                    metrics: ["l": left, "r": right],
                                                                    views: ["v": self]))
           superview?.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-(t)-[v]-(b)-|",
                                                                    options: .alignAllTop,
                                                                    metrics: ["t": top, "b": bottom],
                                                                    views: ["v": self]))
       }
    
    
    func centerInSuperView(offsetX: CGFloat = 0, offsetY: CGFloat = 0) {
          translatesAutoresizingMaskIntoConstraints = false
          centerXInSuperView(offsetX: offsetX)
          centerYInSuperView(offsetY: offsetY)
      }
      
      func centerXInSuperView(offsetX: CGFloat = 0) {
          translatesAutoresizingMaskIntoConstraints = false
          superview?.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: offsetX).isActive = true
      }
      
      func centerYInSuperView(offsetY: CGFloat = 0) {
          translatesAutoresizingMaskIntoConstraints = false
          superview?.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: offsetY).isActive = true
      }
    
   /**
       注册支持隐藏键盘
      */
        @objc public func supportHideKeyBoard() {
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIView._keyboardHide))
            tapGestureRecognizer.cancelsTouchesInView = false
            self.addGestureRecognizer(tapGestureRecognizer)
        }
        
        @objc fileprivate func _keyboardHide() {
            _resignFirstResponder(self)
        }
        
        fileprivate func _resignFirstResponder(_ view: UIView) {
            for v in view.subviews {
                if v.isFirstResponder {
                    v.resignFirstResponder()
                    return
                } else {
                    _resignFirstResponder(v)
                }
            }
        }
      
}




