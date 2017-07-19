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
struct AppStoryboardStruct: RawRepresentable, StoryboardType {
  typealias RawValue = String
  
  let rawValue: String
  
  init(rawValue: String) {
    self.rawValue = rawValue
  }
  
  static var main = AppStoryboardStruct(rawValue: "Main")
}

class FirstViewController: UIViewController {
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    super.prepare(for: segue, sender: sender)
    
    // `Segue` should be initialized with `UIStoryboardSegue` instance.
    if let segue = Segue(segue) {
      NSLog("Segue('\(segue.segueID)') was performed.")
    }
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
  // Define custom scene identifier.
  class func sceneIdentifier(in storyboard: AppStoryboard) -> String? {
    switch storyboard {
    case .main:
      return "First"
    }
  }
  
  class var mainStoryboard: AppStoryboard {
    return .main
  }
}

extension FirstViewController: SeguePerformer {
  // Define `SegueType` as nested enum `Segue`
  typealias SegueType = Segue
  
  // Nested enum `Segue` with defined `UIStoryboardSegue` identifier as implicit `rawValue`
  enum Segue: String, StoryboardSegueType {
    case second
  }
}

class SecondViewController: UIViewController {
  
  @IBAction func pushFirstScene(_ sender: Any?) {
    // Example how to load an instance of FirstViewController from Main.storyboard.
    let viewController = FirstViewController.scene
    // Other examples:
    //  let viewController = AppStoryboard.main.scene() as FirstViewController // load scene from custom storyboard
    //  let viewController = FirstViewController.scene(in: .main) // load scene from custom storyboard
    navigationController?.pushViewController(viewController, animated: true)
  }
  
}

extension SecondViewController: StoryboardSceneType {
  class var mainStoryboard: AppStoryboardStruct {
    return .main
  }
}

