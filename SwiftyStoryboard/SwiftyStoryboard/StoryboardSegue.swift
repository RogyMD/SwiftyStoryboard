//
//  Segue.swift
//  Storyboard
//
//  Created by Rogy on 6/22/17.
//  Copyright © 2017 RogyMD. All rights reserved.
//

import UIKit

/// Represents a `UIStoryboardSegue`'s identifier in `UIStoryboard`.
public protocol StoryboardSegueType {
  
  /// The identifier for the segue object.
  /// You assign identifiers to your segues in Interface Builder. An identifier is a string that your application uses to distinguish one segue from another. For example, if you have a source view controller that can segue to two or more different destination view controllers, you would assign different identifiers to each segue so that the source view controller’s prepareForSegue:sender: method could tell them apart and prepare each segue appropriately.
  var segueID: String { get }
  
}

public extension StoryboardSegueType where Self: RawRepresentable, Self.RawValue == String {
  
  var segueID: String {
    return rawValue
  }
  
}

/// Represents an object that can perform segue.
public protocol SeguePerformer {
  
  associatedtype SegueType: StoryboardSegueType
  
  /// Initiates the segue with the specified identifier from the current segue performer's storyboard file.
  ///
  /// - Parameters:
  ///   - segue: The segue that identifies the triggered segue. In `SeguePerform` you define a type that represents segues that should be performed by performer.
  ///   - sender: The object that you want to use to initiate the segue. This object is made available for informational purposes during the actual segue.
  /// - Returns: `true` if a `UIStoryboardSegue` was performed, otherwise `false`.
  /// - SeeAlso: `Segue`
  func perform(segue: SegueType, sender: Any?) -> Bool
  
}

public extension SeguePerformer where Self: UIViewController {
  
  @discardableResult
  func perform(segue: SegueType, sender: Any? = nil) -> Bool {
    if shouldPerformSegue(withIdentifier: segue.segueID, sender: sender) {
      
      performSegue(withIdentifier: segue.segueID, sender: sender)
      
      return true
    } else {
      return false
    }
  }
  
}
