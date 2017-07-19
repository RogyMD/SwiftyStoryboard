//
//  Storyboard.swift
//  Storyboard
//
//  Created by Rogy on 6/22/17.
//  Copyright © 2017 RogyMD. All rights reserved.
//

import UIKit

/// Represents a type that should load an `UIStoryboard` instance.
public protocol StoryboardType {
  /// The bundle containing the storyboard file and its related resources. If you specify nil, this method looks in the main bundle of the current application.
  var bundle: Bundle? { get }
  
  /// An **new** `UIStoryboard` instance.
  var storyboard: UIStoryboard { get }
  
}

public extension StoryboardType {
  
  var bundle: Bundle? {
    return nil
  }
  
  var initialViewController: UIViewController? {
    return storyboard.instantiateInitialViewController()
  }
  
  func viewController(withIdentifier sceneIdentifier: String) -> UIViewController {
    return storyboard.instantiateViewController(withIdentifier: sceneIdentifier)
  }
}

public extension StoryboardType where Self: RawRepresentable, Self.RawValue == String {
  
  var storyboard: UIStoryboard {
    return UIStoryboard(name: rawValue, bundle: bundle)
  }
  
}

public extension StoryboardType {
  
  /// An **new** instance of `Scene` type.
  func scene<Scene: StoryboardSceneType>() -> Scene where Scene.Storyboard == Self {
    guard let sceneIdentifier = Scene.sceneIdentifier(in: self) else {
      fatalError("Undefined scene identifier for storyboard: \(String(describing: self))")
    }
    
    return viewController(withIdentifier: sceneIdentifier) as! Scene
  }
  
}
