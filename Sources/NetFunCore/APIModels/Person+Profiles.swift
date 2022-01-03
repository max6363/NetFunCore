//
//  File.swift
//  
//
//  Created by Minhaz on 03/01/22.
//

import Foundation

public protocol Person {
    var id: Int { get }
    var name: String { get }
}

public struct Cast: Person, Codable {
    
    public var id: Int
    public var name: String
    
    public init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
}

public struct Director: Person, Codable {
    public var id: Int
    public var name: String
    
    public init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
}

public struct Writer: Person, Codable {
    public var id: Int
    public var name: String
    
    public init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
}
