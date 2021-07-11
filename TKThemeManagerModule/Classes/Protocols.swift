//
//  Protocols.swift
//  TKThemeManagerModule
//
//  Created by 🐶 on 2021/7/10.
//

import Foundation

public protocol Theme {
    
}

protocol TKModel {
    var target: View? { get set }
}

struct ThemeModel<T>: TKModel {
    weak var target: View?
    var closure: (_ target: View?, _ theme:T) -> Void
}


