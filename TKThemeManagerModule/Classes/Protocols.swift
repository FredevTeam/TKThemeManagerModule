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
    var target: UIView? { get set }
}

struct ThemeModel<T>: TKModel {
    weak var target: UIView?
    var closure: (_ target: UIView?, _ theme:T) -> Void
}
