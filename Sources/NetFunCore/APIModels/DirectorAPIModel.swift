//
//  File.swift
//  
//
//  Created by Minhaz on 04/01/22.
//

import Foundation

/// A `Director` API Model that confirms to `Codable`
///
/// It is used in parsing data of Director of a movie or a series.
/// 
public struct Director: Person, Codable {
    public var id: Int
    public var name: String
    
    public init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
}