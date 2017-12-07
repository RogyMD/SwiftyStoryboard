# SwiftyStoryboard
A framework that helps you to operate with `UIStoryboard` and it’s components.

[![Swift version](https://img.shields.io/badge/swift-3.0-orange.svg?style=flat.svg)](https://cocoapods.org/pods/SwiftyStoryboard)
[![Pod Version](http://img.shields.io/cocoapods/v/SwiftyStoryboard.svg?style=flat)](https://cocoapods.org/pods/SwiftyStoryboard)
[![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/RogyMD/SwiftyStoryboard/master/LICENSE)

## Requirements

- iOS 8.0+
- Xcode 8.1+
- Swift 3.0+

## Installation

### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

To integrate SwiftyStoryboard into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'
use_frameworks!

target '<Your Target Name>' do
    pod 'SwiftyStoryboard'
end
```

Then, run the following command:

```bash
$ pod install
```

## Usage

### Create a StoryboardType

```swift
import SwiftyStoryboard

// Enum example of `StoryboardType`.
enum AppStoryboard: String, StoryboardType {
  case main = "Main"
}

// Struct example of `StoryboardType`.
struct AppStoryboardStruct: RawRepresentable, StoryboardType {
  typealias RawValue = String
  
  let rawValue: String
  
  init(rawValue: String) {
    self.rawValue = rawValue
  }
  
  static var main = AppStoryboardStruct(rawValue: "Main")
}

```

### Create a StoryboardSceneType

```swift
import SwiftyStoryboard

class ViewController: UIViewController {}

extension ViewController: StoryboardSceneType {
  class var mainStoryboard: AppStoryboard {
    return .main
  }
}
```

`StoryboardSceneType` provides default class property `scene`. Feel free to use it to initialize an `ViewController` instance.
```swift
let vc = ViewController.scene
```
**Old:**
```swift
let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController") as! ViewController
```

### Create a SeguePerformer

```swift
import SwiftyStoryboard

class ViewController: UIViewController {}

extension ViewController: SeguePerformer {
  // Define `SegueType` as nested enum `Segue`
  typealias SegueType = Segue
  
  // Nested enum `Segue` with defined `UIStoryboardSegue` identifier as implicit `rawValue`
  enum Segue: String, StoryboardSegueType {
    case second
  }
}
```

Perform segues easier.

```swift
perform(segue: .second)
```
**Old:**
```swift
performSegue(withIdentifier: "second", sender: nil)
```

Handle segues in more _swifty_ way.

```swift
override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    super.prepare(for: segue, sender: sender)
    
    // `Segue` should be initialized with `UIStoryboardSegue` instance.
    if let segue = Segue(segue) {
      NSLog("Segue('\(segue.segueID)') was performed.")
    }

    // Old
    if let identifier = segue.identifier, identifier == "second" {
      NSLog("Segue('\(identifier)') was performed.")
    }
}
```

## License

SwiftyStoryboard is released under the MIT license. [See LICENSE](https://raw.githubusercontent.com/RogyMD/SwiftyStoryboard/master/LICENSE) for details.
