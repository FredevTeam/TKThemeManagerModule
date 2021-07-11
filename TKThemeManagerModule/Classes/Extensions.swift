//
//  Extensions.swift
//  TKThemeManagerModule
//
//  Created by 🐶 on 2021/7/10.
//



extension Notification.Name {
    public static let themeUpdateEndNotification = Notification.Name.init("TKThemeManagerModule_ThemeUpdateEndNotification")
    public static let themeWillUpdateNotification = Notification.Name.init("TKThemeManagerModule_ThemeWillUpdateNotification")
}

extension View: NamespaceWrappable{}


extension TypeWrapperProtocol where WrappedType : View {
    public func apply<T>(_ theme: T.Type, closure: @escaping (_ target: View?, _ theme:T) -> Void) {
        
        ThemeManager<T>.shared.map.append(ThemeModel.init(target: self.wrappedValue, closure: closure))
    }
}
