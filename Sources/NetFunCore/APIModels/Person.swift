//
//  File.swift
//  
//
//  Created by Minhaz on 03/01/22.
//

import Foundation

/// A Blueprint protocol for a `Person`
///
/// You can use this Protocol to confirm your `struct` or `class`.
///
///     struct Lawyer: Person {
///         public var id: Int
///         public var name: String
///     }
///
///     public class Doctor: Person {
///         public var id: Int
///         public var name: String
///     }
///
public protocol Person {
    var id: Int { get }
    var name: String { get }
}
