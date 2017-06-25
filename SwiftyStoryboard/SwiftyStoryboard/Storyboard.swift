//
//  Storyboard.swift
//  Storyboard
//
//  Created by Rogy on 6/22/17.
//  Copyright © 2017 RogyMD. All rights reserved.
//

import UIKit

/// Represents a type that should load an `UIStoryboard` instance.
public protocol Storyboard {
  
  /// A type that represents a `UIViewController` subclass.
  associatedtype Scene: UIViewController
  
  /// The bundle containing the storyboard file and its related resources. If you specify nil, this method looks in the main bundle of the current application.
  var bundle: Bundle? { get }
  
  /// An **new** `UIStoryboard` instance.
  var storyboard: UIStoryboard { get }
  
}

public extension Storyboard {
  
  var bundle: Bundle? {
    return nil
  }
  
  var initialViewController: UIViewController? {
    return storyboard.instantiateInitialViewController()
  }
  
}

public extension Storyboard where Self.Scene: SceneIdentifiable {
  
  /// An **new** `Scene` instance.
  var scene: Scene {
    return storyboard.instantiateViewController(withIdentifier: Scene.sceneID) as! Scene
  }
  
}

public extension Storyboard where Self: RawRepresentable, Self.RawValue == String {
  
  var storyboard: UIStoryboard {
    return UIStoryboard(name: rawValue, bundle: bundle)
  }
  
}
