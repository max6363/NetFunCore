//
//  File.swift
//  
//
//  Created by Minhaz on 03/01/22.
//

import Foundation

/// The `PlayableContentMediaProtocol` protocol indicates to confirm with provided keys available in json.
///
public protocol PlayableContentMediaProtocol {
    
    /// The ID of Media to get value of `id`
    var id: Int? { get }
    
    /// The title or name of Media to get value of `title`
    ///
    /// e.g. "Madagaskar", "Episode 1 of a Series"
    var title: String? { get }
    
    /// The duration of a Playable Media to get `length` (in seconds)
    var duration: Int? { get }
    
    /// The media type of a Playable Media to get type. i.e. "video", "audio"
    var mediaType: String? { get }
}

/// The `PlayableContentMedia` struct confirms to "Protocol" - `PlayableContentMediaProtocol`
///
/// **Json** representation,
///
/// 1. An **Episode** of a Series,
///     ```
///     {
///         "id": 1,
///         "title": "Episode 1",
///         "mediaType": "video",
///         "duration": 3600
///     }
///     ```
///
/// 2. A  **Movie**,
///     ```
///     {
///         "id": 1,
///         "title": "Movie name",
///         "mediaType": "video",
///         "duration": 3600
///     }
///     ```
///
public struct PlayableContentMedia: PlayableContentMediaProtocol, Codable {
    public var id: Int?
    public var title: String?
    public var duration: Int?
    public var mediaType: String?
        
    /// A private enum `CodingKeys` to decode values from json
    private enum CondingKeys: String, CodingKey {
        case id; case title; case duration; case mediaType
    }
    
    /// A decoding `init` function
    ///
    /// - Parameter decoder: A `Decoder` object
    ///
    /// - Throws: an error when decoding fails
    ///
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.duration = try container.decodeIfPresent(Int.self, forKey: .duration) ?? nil
        self.mediaType = try container.decodeIfPresent(String.self, forKey: .mediaType) ?? nil
        self.title = try container.decodeIfPresent(String.self, forKey: .title) ?? nil
        self.id = try container.decodeIfPresent(Int.self, forKey: .id) ?? nil
    }
}


/// The `PlayableContentProtocol` protocol indicates to confirm with provided keys available in json.
///
public protocol PlayableContentProtocol {
    
    /// The ID of the Playable Content
    var id: Int { get }
    
    /// The title or name of the Playable Content
    var title: String { get }
    
    /// The playable content type
    ///
    /// e.g. "series" => Arya, "movie" => Madagaskar
    var type: String { get }
    
    /// The media, an array of one movie/video or episodes of a series.
    var media: [PlayableContentMedia] { get }
}


/// The `PlayableContentMetadataProtocol` protocol indicates to confirm with provided keys available in json.
///
public protocol PlayableContentMetadataProtocol {
    
    /// The director of `PlayableContent`
    var director: Director? { get }
    
    /// The Writers of `PlayableContent`
    var writers: [Writer]? { get }
    
    /// The Cast of `PlayableContent`
    var cast: [Cast]? { get }
    
    /// The release date of `PlayableContent`
    var releasedDate: String? { get }
}

/// The `PlayableContentData` struct confirms to protocols - `PlayableContentProtocol`, `PlayableContentMetadataProtocol` & `Codable`
///
/// **Json** representation,
///
///     ```
///     {
///         "id": 1,
///         "cast": [
///             {
///                 "id": 12,
///                 "name": "Actor 1"
///             },
///             {
///                 "id": 13,
///                 "name": "Actor 2"
///             }
///         ],
///         "title": "Madagaskar",
///         "media": [
///             {
///                 "mediaType": "video",
///                 "duration": 85
///             }
///         ],
///         "releasedDate": "2003-08-12T20:17:46Z",
///         "type": "movie",
///         "writers": [
///             {
///                 "id": 14,
///                 "name": "Writer 1"
///             }
///         ],
///         "director": {
///             "id": 11,
///             "name": "John Parker"
///         }
///     }
///     ```
///
public struct PlayableContentData: PlayableContentProtocol, PlayableContentMetadataProtocol, Codable {
        
    public var id: Int
    public var title: String
    public var type: String
    public var media: [PlayableContentMedia]
    
    public var director: Director?
    public var writers: [Writer]?
    public var cast: [Cast]?
    public var releasedDate: String?
}

/// The `CollectionItemProtocol` protocol indicates to confirm with provided keys available in json.
///
/// It has a set of Playable Content. e.g. a collection of items consisting of "Movie" & "Series".
///
public protocol CollectionItemProtocol {
    
    /// The ID of the collection
    var id: Int { get }
    
    /// The title or name of the Playable Content
    var title: String { get }
    
    /// A set of Playable Content. e.g. a collection of items consisting of "Movie" & "Series".
    var items: [PlayableContentData] { get }
}

/// A struct which confirms `CollectionItemProtocol` & `Codable`
///
public struct CollectionItemData: CollectionItemProtocol, Codable {
    public var id: Int
    public var title: String
    public var items: [PlayableContentData]
}

/// The `UserProfileProtocol` protocol indicates to confirm with provided keys available in json.
///
public protocol UserProfileProtocol {
    
    /// ID of the Profile
    var id: Int { get }
    
    /// name of User Profile
    var name: String { get }
    
    /// username of User Profile
    var username: String { get }
}

/// A struct which confirms `UserProfileProtocol` & `Codable`
///
public struct UserProfileData: UserProfileProtocol, Codable {
    public var id: Int
    public var name: String
    public var username: String
}

/// The `HomeContentAPIProtocol` protocol indicates to confirm with provided keys available in json.
///
public protocol HomeContentAPIProtocol {
    var id: Int? { get }
    var profile: UserProfileData? { get }
    var collection: [CollectionItemData] { get }
}

/// A struct which confirms `HomeContentAPIProtocol` & `Codable`
/// ```
/// {
///     "id": 7,
///     "profile": {
///         "id": 2,
///         "name": "Mike Hanigan",
///         "username": "mikeH"
///     },
///     "collection": [
///         {
///             "id": 500,
///             "title": "Continue Watching",
///             "items": [
///                 {
///                     "id": 1,
///                     "cast": [
///                         {
///                             "id": 12,
///                             "name": "Actor 1"
///                         },
///                         {
///                             "id": 13,
///                             "name": "Actor 2"
///                         }
///                     ],
///                     "title": "Ice Age 1",
///                     "media": [
///                         {
///                             "mediaType": "video",
///                             "duration": 95
///                         }
///                     ],
///                     "releasedDate": "2003-08-12T20:17:46Z",
///                     "type": "movie",
///                     "writers": [
///                         {
///                             "id": 14,
///                             "name": "Writer 1"
///                         }
///                     ],
///                     "director": {
///                         "id": 11,
///                         "name": "John Parker"
///                     }
///                 },
///                 {
///                     "id": 2,
///                     "cast": [
///                         {
///                             "id": 12,
///                             "name": "Actor 1"
///                         },
///                         {
///                             "id": 13,
///                             "name": "Actor 2"
///                         }
///                     ],
///                     "title": "Arya 2",
///                     "media": [
///                         {
///                             "id": 1001,
///                             "title": "Episode 1",
///                             "mediaType": "video",
///                             "duration": 45
///                         },
///                         {
///                             "id": 1002,
///                             "title": "Episode 2",
///                             "mediaType": "video",
///                             "duration": 40
///                         },
///                         {
///                             "id": 1003,
///                             "title": "Episode 3",
///                             "mediaType": "video",
///                             "duration": 55
///                         }
///                     ],
///                     "releasedDate": "2019-08-12T20:17:46Z",
///                     "type": "series",
///                     "writers": [
///                         {
///                             "id": 14,
///                             "name": "Writer 1"
///                         }
///                     ],
///                     "director": {
///                         "id": 11,
///                         "name": "John Parker"
///                     }
///                 }
///             ]
///         }
///     ]
/// }
/// ```
///
/// A `Codable` Model for the home page data of a user.
///
public struct HomeContentAPIModel: HomeContentAPIProtocol, Codable {
    public var id: Int? = 0
    public var profile: UserProfileData?
    public var collection: [CollectionItemData]
    
    public init(collection: [CollectionItemData]) {
        self.collection = collection
    }
}
