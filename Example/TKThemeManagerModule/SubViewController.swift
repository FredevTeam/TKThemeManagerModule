//
//  SubViewController.swift
//  TKThemeManagerModule_Example
//
//  Created by 🐶 on 2021/7/10.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import UIKit
import TKThemeManagerModule

class SubViewController: UIViewController {

    private let label = UILabel.init()
    private let testView = UIView.init()
    
    private let button = UIButton.init()
}


extension SubViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        label.text = "Theme"
        label.frame = CGRect.init(x: 10, y: 100, width: 100, height: 50)
        view.addSubview(label)
        testView.frame = CGRect.init(x: 10, y: 200, width: 100, height: 100)
        view.addSubview(testView)
        
        themeManager()
        
        button.setTitle("test", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.sizeToFit()
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        button.frame = CGRect.init(x: 10, y: 300, width: 100, height: 50)
        view.addSubview(button)
        
    }
}

extension SubViewController {
    private func themeManager() {
        label.theme.apply(ThemeProtocol.self) { [weak self] view, theme in
            self?.label.textColor = theme.textColor
            self?.label.backgroundColor = theme.backgroudColor
        }
        testView.theme.apply(ThemeProtocol.self) { view, theme in
            view?.backgroundColor = theme.backgroudColor
        }
    }
}

extension SubViewController {
    @objc private func buttonAction() {
        ThemeManager.shared.switch(ThemeType.dark.theme)
    }
}
