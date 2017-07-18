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
  
  /// A type that represents a `UIViewController` subclass.
  associatedtype Scene: UIViewController
  
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
  
}

public extension StoryboardType where Self: RawRepresentable, Self.RawValue == String {
  
  var storyboard: UIStoryboard {
    return UIStoryboard(name: rawValue, bundle: bundle)
  }
  
}

public extension StoryboardType where Self.Scene: StoryboardSceneType {
  
  /// An **new** `Scene` instance.
  var scene: Scene {
    return storyboard.instantiateViewController(withIdentifier: Scene.sceneIdentifier) as! Scene
  }
  
}
