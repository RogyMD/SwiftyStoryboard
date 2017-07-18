//
//  Scene.swift
//  Storyboard
//
//  Created by Rogy on 6/22/17.
//  Copyright © 2017 RogyMD. All rights reserved.
//

import UIKit

/// Represents a scene in `UIStoryboard` with required identifier.
/// - SeeAlso: `SceneIdentifiable` protocol
public protocol StoryboardSceneType {
  /// The storyboard from which the scene originated.
  ///
  /// When this protocol is adopted by a `UIViewController` subclass, it returns unwrapped `storyboard` value.
  var storyboard: UIStoryboard { get }
  
  /// An identifier string that uniquely identifies the scene in the storyboard file. You set the identifier for a given scene in Interface Builder when configuring the storyboard file.
  ///
  /// - Important:
  /// By default when `SceneIdentifiable` is adopted by a `UIViewController` _subclass_ it returns string representation of it's _type_. You could override this property.
  static var sceneIdentifier: String { get }
}

public extension StoryboardSceneType where Self: UIViewController {
  var storyboard: UIStoryboard {
    return storyboard!
  }
  
  static var sceneIdentifier: String {
    return "\(self)"
  }
}
