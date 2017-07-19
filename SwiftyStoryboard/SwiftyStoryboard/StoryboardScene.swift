//
//  Scene.swift
//  Storyboard
//
//  Created by Rogy on 6/22/17.
//  Copyright © 2017 RogyMD. All rights reserved.
//

import UIKit

/// Represents a scene in `UIStoryboard` with required identifier.
public protocol StoryboardSceneType {
  
  /// The storyboard type that contains scene.
  ///
  /// - SeeAlso: `StoryboardType`
  associatedtype Storyboard: StoryboardType
  
  /// The storyboard from which the scene originated.
  ///
  /// When this protocol is adopted by a `UIViewController` subclass, it returns unwrapped `storyboard` value.
  var storyboard: UIStoryboard { get }
  
  /// An identifier string that uniquely identifies the scene in the storyboard file. You set the identifier for a given scene in Interface Builder when configuring the storyboard file.
  ///
  /// - Important:
  /// By default when `StoryboardSceneType` is adopted by a `UIViewController` _subclass_ it returns string representation of it's _type_ for all `storyboard`-s. You could override this function.
  ///
  /// - Parameter storyboard: `Storyboard` represents storyboard file for scene.
  /// - Returns: An identifier string that uniquely identifies the scene in the storyboard file or `nil` when `storyboard` doesn't contains scene of this type.
  static func sceneIdentifier(in storyboard: Storyboard) -> String?
  
  /// Main storyboard that contains scene.
  static var mainStoryboard: Storyboard { get }
}

public extension StoryboardSceneType where Self: UIViewController {
  var storyboard: UIStoryboard {
    return storyboard!
  }
  
  /// Scene from `mainStoryboard`.
  /// - SeeAlso: `mainStoryboard`, `scene(in:)`
  static var scene: Self {
    return scene(in: mainStoryboard)
  }
  
  static func sceneIdentifier(in storyboard: Storyboard) -> String? {
    return "\(self)"
  }
  
  
  /// Initialize a new scene from `storyboard` and return it.
  ///
  /// - Parameter storyboard: Storyboard that contains scene.
  /// - Returns: Initialized scene from `storyboard`.
  static func scene(in storyboard: Storyboard) -> Self {
    return storyboard.scene()
  }
}
