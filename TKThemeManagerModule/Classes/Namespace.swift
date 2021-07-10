//
//  Namespace.swift
//  TKThemeManagerModule
//
//  Created by 🐶 on 2021/7/10.
//

import Foundation

/// 命名空间协议  此处的 ui 是类协议的
public protocol NamespaceWrappable {
    associatedtype WrapperType
    var theme: WrapperType { get }
    static var theme: WrapperType.Type { get }
}

public extension NamespaceWrappable {
    var theme: NamespaceWrapper<Self> {
        return NamespaceWrapper(value: self)
    }
    static var theme: NamespaceWrapper<Self>.Type {
        return NamespaceWrapper.self
    }
}

// 此处的是object 对象的
public protocol TypeWrapperProtocol {
    associatedtype WrappedType
    var wrappedValue: WrappedType { get }
    init(value: WrappedType)
}

public struct NamespaceWrapper<T>: TypeWrapperProtocol {
    public let wrappedValue: T
    public init(value: T) {
        self.wrappedValue = value
    }
}


