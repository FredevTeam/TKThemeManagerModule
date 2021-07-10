# TKThemeManagerModule

[![CI Status](https://img.shields.io/travis/playtomandjerry@outlook.com/TKThemeManagerModule.svg?style=flat)](https://travis-ci.org/playtomandjerry@outlook.com/TKThemeManagerModule)
[![Version](https://img.shields.io/cocoapods/v/TKThemeManagerModule.svg?style=flat)](https://cocoapods.org/pods/TKThemeManagerModule)
[![License](https://img.shields.io/cocoapods/l/TKThemeManagerModule.svg?style=flat)](https://cocoapods.org/pods/TKThemeManagerModule)
[![Platform](https://img.shields.io/cocoapods/p/TKThemeManagerModule.svg?style=flat)](https://cocoapods.org/pods/TKThemeManagerModule)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

TKThemeManagerModule is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'TKThemeManagerModule'
```

## example 
### 1. create theme protocl 

```
protocol ThemeProtocol:Theme  {
    var textColor: UIColor { get }
    var labelBackgroudColor: UIColor { get }
    var backgroudColor: UIColor { get }
}

```
### 2. create theme object exmaple: Dark, Light 

* Dark Theme 

```

struct DarkTheme : ThemeProtocol{
    var textColor: UIColor = UIColor.yellow
    
    var labelBackgroudColor: UIColor = UIColor.green
    
    var backgroudColor: UIColor = UIColor.red
}

```

* Light Theme

```
struct LightTheme: ThemeProtocol {
    var textColor: UIColor = UIColor.red
    
    var labelBackgroudColor: UIColor = UIColor.blue
    
    var backgroudColor: UIColor = UIColor.gray
}
```

you can create other theme struct or class 

and you can create theme type enum manager theme obj, for example: 

```
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
}

```

## 3. init manage and set default theme 

```
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        ThemeManager<ThemeProtocol>.shared.switch(ThemeType.light.theme)
        return true
    }

```

## 4. Operation of theme change 
### use notification 

has two notification , Before the change `themeWillUpdateNotification` and After the change `themeUpdateEndNotification`

```
1. add notificaton observer 

 NotificationCenter.default.addObserver(self, selector: #selector(themeChangeNotification), name: .themeUpdateEndNotification, object: nil) 



@objc private func themeChangeNotification() {
       // TODO: update for theme
}

```
### use protocol 

```
label.theme.apply(ThemeProtocol.self) { [weak self] view, theme in
    // TODO: update for theme ,
    // view is label,
    // theme is After the change
}

```


## 5. change theme  

```
ThemeManager.shared.switch(ThemeType.dark.theme)

```



## Author

playtomandjerry@outlook.com, playtomandjerry@gmail.com

## License

TKThemeManagerModule is available under the MIT license. See the LICENSE file for more info.
