//
//  File.swift
//  
//
//  Created by Minhaz on 03/01/22.
//

import Foundation

// MARK: Media
public protocol PlayableContentMediaProtocol {
    var id: Int? { get }
    var title: String? { get }
    var duration: Int? { get }
    var mediaType: String? { get } // video, audio
}

public struct PlayableContentMedia: PlayableContentMediaProtocol, Codable {
    public var id: Int?
    public var title: String?
    public var duration: Int?
    public var mediaType: String?
    
    private enum CondingKeys: String, CodingKey {
        case id; case title; case duration; case mediaType
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.duration = try container.decodeIfPresent(Int.self, forKey: .duration) ?? nil
        self.mediaType = try container.decodeIfPresent(String.self, forKey: .mediaType) ?? nil
        self.title = try container.decodeIfPresent(String.self, forKey: .title) ?? nil
        self.id = try container.decodeIfPresent(Int.self, forKey: .id) ?? nil
    }
}

// MARK: Playable Content
public protocol PlayableContentProtocol {
    var id: Int { get }
    var title: String { get }
    var type: String { get } // series, movie
    var media: [PlayableContentMedia] { get }
}

public protocol PlayableContentMetadataProtocol {
    var director: Director? { get }
    var writers: [Writer]? { get }
    var cast: [Cast]? { get }
    var releasedDate: String? { get }
}

public struct PlayableContentData: PlayableContentProtocol, PlayableContentMetadataProtocol, Codable {
        
    public var id: Int
    public var title: String
    public var type: String
    public var media: [PlayableContentMedia]
    
    // meta-data
    public var director: Director?
    public var writers: [Writer]?
    public var cast: [Cast]?
    public var releasedDate: String?
}

// MARK: Collection Data
public protocol CollectionItemProtocol {
    var id: Int { get }
    var title: String { get }
    var items: [PlayableContentData] { get }
}

public struct CollectionItemData: CollectionItemProtocol, Codable {
    public var id: Int
    public var title: String
    public var items: [PlayableContentData]
}

// MARK: User Profile Data
public protocol UserProfileProtocol {
    var id: Int { get }
    var name: String { get }
    var username: String { get }
}

public struct UserProfileData: UserProfileProtocol, Codable {
    public var id: Int
    public var name: String
    public var username: String
}

// MARK: Home Data
public protocol HomeContentAPIProtocol {
    var id: Int? { get }
    var profile: UserProfileData? { get }
    var collection: [CollectionItemData] { get }
}

public struct HomeContentAPIModel: HomeContentAPIProtocol, Codable {
    public var id: Int? = 0
    public var profile: UserProfileData?
    public var collection: [CollectionItemData]
    
    public init(collection: [CollectionItemData]) {
        self.collection = collection
    }
}
