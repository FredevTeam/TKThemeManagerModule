//
//  Types.swift
//  TKThemeManagerModule
//
//  Created by 🐶 on 2021/7/11.
//

import Foundation


#if os(macOS)

import AppKit

public typealias View            = NSView

#else

import UIKit

public typealias View            = UIView


#endif

