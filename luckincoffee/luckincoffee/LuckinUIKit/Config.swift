//
//  Config.swift
//  luckincoffee
//
//  Created by taozhang on 2020/4/30.
//  Copyright © 2020 Easyhong. All rights reserved.
//

import Foundation
import UIKit

/**
 * screenRect: 窗体大小
 *
 */
let screenRect = UIScreen.main.bounds

/**
 * screenSize: 窗体尺寸
 *
 */
let screenSize = screenRect.size

/**
 * screenWidth: 窗体宽
 *
 */
let screenWidth = screenSize.width

/**
 * screenHeight: 窗体高
 *
 */
let screenHeight = screenSize.height

/**
 * widthScale: 缩放比例
 *
 */
let widthScale = screenWidth / 375

/**
 * heightScale: 高度比例
 *
 */
let heightScale = screenHeight / 667

/**
 * sandboxPath: 应用程序沙盒目录
 *
 */
public let sandboxPath: String = (NSSearchPathForDirectoriesInDomains(.documentDirectory,
                                                                      .userDomainMask, true)).first!
/**
 *  uiFontName: 字体
 */
let uiFontName = "Helvetica"
