//
//  ViewController.swift
//  Example
//
//  Created by Rogy on 6/23/17.
//  Copyright © 2017 RogyMD. All rights reserved.
//

import UIKit
import SwiftyStoryboard

/// Enum example of `Storyboard`.
enum AppStoryboard<T: UIViewController>: String, Storyboard {
  typealias Scene = T
  
  case main = "Main"
}


/// Struct example of `Storyboard`.
/// - Important: In case that `Storyboard` is a `struct` you are **forced to adopt** `protocol` `ExpressibleByStringLiteral`.
struct AppStoryboardStruct<T: UIViewController>: RawRepresentable, Storyboard, ExpressibleByStringLiteral {
  typealias RawValue = String
  typealias Scene = T
  
  let rawValue: String
  
  init?(rawValue: String) {
    self.rawValue = rawValue
  }
  
  init(stringLiteral value: String) {
    rawValue = value
  }
  
  init(unicodeScalarLiteral value: String) {
    rawValue = value
  }
  
  init(extendedGraphemeClusterLiteral value: String) {
    rawValue = value
  }
  
  static var main: AppStoryboardStruct<T> { return "Main" }
}

class FirstViewController: UIViewController, SeguePerformer {
  // Define `SegyeType` as nested enum `Segue`
  typealias SegueType = Segue
  
  // Nested enum `Segue` with that define `UIStoryboardSegue` identifier as `case`
  enum Segue: String, SwiftyStoryboard.Segue {
    case second
  }
  
  @IBAction func performSecondSegue(_ sender: Any?) {
    // Perform storyboard segue using perform(segue:sender:) defined method in `SeguePerformer`
    perform(segue: .second)
  }
  
  @IBAction func presentInitialViewController(_ sender: Any?) {
    // Load initial view controller from Main.storyboard using AppStroryboardStruct.
    let viewController = AppStoryboardStruct.main.initialViewController!
    present(viewController, animated: true)
  }
}

extension FirstViewController: Scene {
  class var sceneID: String {
    return "First"
  }
}

class SecondViewController: UIViewController {
  
  @IBAction func pushFirstScene(_ sender: Any?) {
    // Example how to load an instance of FirstViewController from Main.storyboard.
    let viewController = AppStoryboard<FirstViewController>.main.scene
    navigationController?.pushViewController(viewController, animated: true)
  }
  
}

extension SecondViewController: Scene {}

