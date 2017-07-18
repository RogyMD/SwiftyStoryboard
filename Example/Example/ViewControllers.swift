//
//  ViewController.swift
//  Example
//
//  Created by Rogy on 6/23/17.
//  Copyright © 2017 RogyMD. All rights reserved.
//

import UIKit
import SwiftyStoryboard

/// Enum example of `StoryboardType`.
enum AppStoryboard: String, StoryboardType {
  case main = "Main"
}


/// Struct example of `StoryboardType`.
/// - Important: In case that `StoryboardType` is a `struct` you are **forced to adopt** `protocol` `ExpressibleByStringLiteral`.
struct AppStoryboardStruct: RawRepresentable, StoryboardType, ExpressibleByStringLiteral {
  typealias RawValue = String
  
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
  
  static var main: AppStoryboardStruct { return "Main" }
}

class FirstViewController: UIViewController, SeguePerformer {
  // Define `SegyeType` as nested enum `Segue`
  typealias SegueType = Segue
  
  // Nested enum `Segue` with that define `UIStoryboardSegue` identifier as `case`
  enum Segue: String, StoryboardSegueType {
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

extension FirstViewController: StoryboardSceneType {
  // Defined custom scene identifier
  class var sceneIdentifier: String {
    return "First"
  }
}

class SecondViewController: UIViewController {
  
  @IBAction func pushFirstScene(_ sender: Any?) {
    // Example how to load an instance of FirstViewController from Main.storyboard.
    let viewController = AppStoryboard.main.scene() as FirstViewController
    navigationController?.pushViewController(viewController, animated: true)
  }
  
}

extension SecondViewController: StoryboardSceneType {}

