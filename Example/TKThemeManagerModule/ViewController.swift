//
//  ViewController.swift
//  TKThemeManagerModule
//
//  Created by playtomandjerry@outlook.com on 07/07/2021.
//  Copyright (c) 2021 playtomandjerry@outlook.com. All rights reserved.
//

import UIKit
import TKThemeManagerModule
class ViewController: UIViewController {
    private var label = UILabel.init()
}

extension ViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = "Text"
        label.textColor = UIColor.black
        label.frame = CGRect.init(x: 10, y: 100, width: 100, height: 50)
        view.addSubview(label)
        
        label.isUserInteractionEnabled = true
        label.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(push)))
        
        NotificationCenter.default.addObserver(self, selector: #selector(themeChangeNotification), name: .themeUpdateEndNotification, object: nil)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        ThemeManager.shared.switch(ThemeType.dark)
    }
}

extension ViewController {
    private func themeManager() {
        
    }
    @objc private func push() {
        self.navigationController?.pushViewController(SubViewController.init(), animated: true)
    }
}

extension ViewController {
    // theme change
    @objc private func themeChangeNotification() {
        let color = ThemeManager<ThemeProtocol>.shared.current?.textColor
        label.textColor = color
        label.backgroundColor = ThemeManager<ThemeProtocol>.shared.current?.backgroudColor
    }
}
