//
//  ThemeType.swift
//  TKThemeManagerModule_Example
//
//  Created by 🐶 on 2021/7/10.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Foundation
import TKThemeManagerModule
enum ThemeType {
    case light
    case dark
}

extension ThemeType {
    var theme: ThemeProtocol {
        switch self {
        case .dark:
            return DarkTheme.init()
        default:
            return LightTheme.init()
        }
    }
    
//    typealias T = ThemeProtocol
}
