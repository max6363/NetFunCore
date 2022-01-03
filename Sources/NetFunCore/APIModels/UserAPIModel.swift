//
//  File.swift
//  
//
//  Created by Minhaz on 03/01/22.
//

import Foundation

public struct UserAPIModel: Person, Codable {
    public var id: Int
    public var name: String
    public let username: String
    
    public init(id: Int, name: String, username: String) {
        self.id = id
        self.name = name
        self.username = username
    }
}
