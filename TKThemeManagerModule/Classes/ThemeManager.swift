//
//  ThemeManager.swift
//  TKThemeManagerModule
//
//  Created by 🐶 on 2021/7/7.
//

import Foundation


private var single_store:[String: AnyObject] = [:]

public class ThemeManager<T> {
    public static var shared: ThemeManager<T> {
        let store_key = String(describing: T.self)
        if let single = single_store[store_key] {
            return single as! ThemeManager<T>
        }else {
            let new_single = ThemeManager<T>.init()
            single_store[store_key] = new_single
            return new_single
        }
    }
    
    
    public private(set) var current: T? {
        willSet {
            NotificationCenter.default.post(name: .themeWillUpdateNotification, object: self)
        }
        didSet {
            changeTheme()
            NotificationCenter.default.post(name: .themeUpdateEndNotification, object: self)
        }
    }
    
    var map:[TKModel] = []
}

extension ThemeManager {
    public func `switch`(_ theme: T) {
        DispatchQueue.main.async {
            self.current = theme
        }
    }
}


extension ThemeManager {
    private func changeTheme() {
        guard  let current = self.current else {
            return
        }
        map = map.filter{$0.target != nil}
        map.forEach { m in
            if let m = m as? ThemeModel<T> {
                m.closure(m.target, current)
            }
        }
    }
}
