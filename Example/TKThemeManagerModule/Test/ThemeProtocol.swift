//
//  ThemeProtocol.swift
//  TKThemeManagerModule_Example
//
//  Created by 🐶 on 2021/7/10.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import UIKit
import TKThemeManagerModule
protocol ThemeProtocol:Theme  {
    var textColor: UIColor { get }
    var labelBackgroudColor: UIColor { get }
    var backgroudColor: UIColor { get }
}
