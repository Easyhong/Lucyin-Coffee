//
//  GradientColor.swift
//  luckincoffee
//
//  Created by taozhang on 2020/4/30.
//  Copyright © 2020 Easyhong. All rights reserved.
//

import Foundation
import UIKit

struct GradientColor {
    
    // MARK: - 起始颜色
       public var start: UIColor
       // MARK: - 结束颜色
       public var end: UIColor

       public init(start: UIColor, end: UIColor) {
           self.start = start
           self.end = end
       }

       // MARK: - 初始化 渐变色格式 xxxxxx-xxxxxx
       public init(color: String) {
           let colors = color.components(separatedBy: "-")
           if colors.count != 2 {
               start = UIColor.white
               end = UIColor.white
           } else {
               start = UIColor(hexString: colors[0])
               end = UIColor(hexString: colors[1])
           }
       }

       public var hexString: String {
           return start.hexString() + "-" + end.hexString()
       }
    
}

