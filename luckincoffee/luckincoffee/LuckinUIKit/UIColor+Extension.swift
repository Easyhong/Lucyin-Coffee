//
//  UIColor+Extension.swift
//  luckincoffee
//
//  Created by taozhang on 2020/4/30.
//  Copyright © 2020 Easyhong. All rights reserved.
//

import Foundation
import UIKit

public extension UIColor {
    
    static var random: UIColor {
        let r = CGFloat(arc4random() % 256)
        let g = CGFloat(arc4random() % 256)
        let b = CGFloat(arc4random() % 256)
        return UIColor(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: 1)
    }
    
    convenience init(hexString: String, alpha: CGFloat = 1) {
        var red: CGFloat        = 1.0
        var green: CGFloat      = 1.0
        var blue: CGFloat       = 1.0
        var tempAlpha: CGFloat  = 1.0
        
        if let color = UIColor.colorWithHexString(hexString: hexString) {
            color.getRed(&red, green: &green, blue: &blue, alpha: &tempAlpha)
        }
        
        self.init(red:red, green:green, blue:blue, alpha:alpha)
    }
    
    func hexString(includeAlpha: Bool = false) -> String {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        self.getRed(&r, green: &g, blue: &b, alpha: &a)
        
        if (includeAlpha) {
            return String(format: "%02X%02X%02X%02X", Int(r * 255), Int(g * 255), Int(b * 255), Int(a * 255))
        } else {
            return String(format: "%02X%02X%02X", Int(r * 255), Int(g * 255), Int(b * 255))
        }
    }
    
     class func colorWithHexString(hexString: String) -> UIColor? {
        if let colorString = validateHexString(hexString: hexString) {
            let count = colorString.count
            
            switch count {
            case 3:
                return getRGB(colorString: colorString)
            case 4:
                return getARGB(colorString: colorString)
            case 6:
                return getRRGGBB(colorString: colorString)
            case 8:
                return getAARRGGBB(colorString: colorString)
            default:
                return nil
            }
        } else {
            return nil
        }
    }
    
    private class func getRGB(colorString: String) -> UIColor {
        let red     = getHexValueFrom(string: colorString, start: 0, length: 1)
        let green   = getHexValueFrom(string: colorString, start: 1, length: 1)
        let blue    = getHexValueFrom(string: colorString, start: 2, length: 1)
        
        return UIColor(red: CGFloat(red)/255, green: CGFloat(green)/255, blue: CGFloat(blue)/255, alpha: 1.0)
    }
    
    private class func getARGB(colorString: String) -> UIColor {
        let alpha   = getHexValueFrom(string: colorString, start: 0, length: 1)
        let red     = getHexValueFrom(string: colorString, start: 1, length: 1)
        let green   = getHexValueFrom(string: colorString, start: 2, length: 1)
        let blue    = getHexValueFrom(string: colorString, start: 3, length: 1)
        
        return UIColor(red: CGFloat(red)/255, green: CGFloat(green)/255, blue: CGFloat(blue)/255, alpha: CGFloat(alpha)/255)
    }
    
    private class func getRRGGBB(colorString: String) -> UIColor {
        let red     = getHexValueFrom(string: colorString, start: 0, length: 2)
        let green   = getHexValueFrom(string: colorString, start: 2, length: 2)
        let blue    = getHexValueFrom(string: colorString, start: 4, length: 2)
        
        return UIColor(red: CGFloat(red)/255, green: CGFloat(green)/255, blue: CGFloat(blue)/255, alpha: 1.0)
    }
    
    private class func getAARRGGBB(colorString: String) -> UIColor {
        let alpha   = getHexValueFrom(string: colorString, start: 0, length: 2)
        let red     = getHexValueFrom(string: colorString, start: 2, length: 2)
        let green   = getHexValueFrom(string: colorString, start: 4, length: 2)
        let blue    = getHexValueFrom(string: colorString, start: 6, length: 2)
        
        return UIColor(red: CGFloat(red)/255, green: CGFloat(green)/255, blue: CGFloat(blue)/255, alpha: CGFloat(alpha)/255)
    }
    
    class func validateHexString(hexString: String) -> String? {
        if hexString == "" { return nil }
        if (hexString as NSString).substring(to: 1) != "#" {
            let length = hexString.count
            if !(length == 3 || length == 4 || length == 6 || length == 8) {
                return nil
            }
        } else {
            let length = hexString.count
            if !(length == 4 || length == 5 || length == 7 || length == 9) {
                return nil
            }
        }
        let colorString = hexString.replacingOccurrences(of: "#", with: "").uppercased()
        let disallowedCharacters = NSCharacterSet(charactersIn: "0123456789ABCDEF").inverted
        if (colorString as NSString).rangeOfCharacter(from: disallowedCharacters).location != NSNotFound {
            return nil
        }
        return colorString
    }
    
    private class func getHexValueFrom(string: String, start: Int, length: Int) -> CUnsignedInt {
        var result: CUnsignedInt = 0
        let colorValue = (string as NSString).substring(with: NSMakeRange(start, length))
        let scanner = Scanner(string: colorValue.count == 2 ? colorValue  : "\(colorValue)\(colorValue)")
        scanner.scanHexInt32(&result)
        return result
    }
    
}


