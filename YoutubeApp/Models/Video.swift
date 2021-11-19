//
//  Video.swift
//  YoutubeApp
//
//  Created by Edward Phan on 2021-11-13.
//

import Foundation

struct Video: Decodable {
    var videoId = ""
    var title = ""
    var description = ""
    var thumbnail = ""
    var published = Date()
    
    enum CodingKeys: String, CodingKey {
        case snippet
        case thumbnails
        case high
        case resourceId
        case published = "publishedAt"
        case title
        case description
        case thumbnail = "url"
        case videoId
    }
    
    init() {
        self.videoId = "1234567890"
        self.title = "I am a video"
        self.description = "This is a description, it should be long enough to take up at least a few lines in the UI"
        self.thumbnail = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/i/8148075f-b6da-4dc9-a294-8db39dcfd067/dds0jo6-4d9e2c50-9c1b-472c-8a4e-8b7d77bd3fae.jpg"
        self.published = Date()
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let snippetContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .snippet)
        
        // parse title
        self.title = try snippetContainer.decode(String.self, forKey: .title)
        
        // parse description
        self.description = try snippetContainer.decode(String.self, forKey: .description)
        
        // parse published date
        self.published = try snippetContainer.decode(Date.self, forKey: .published)
        
        // parse the thumbnail
        let thumbnailContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .thumbnails)
        let highContainer = try thumbnailContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .high)
        
        self.thumbnail = try highContainer.decode(String.self, forKey: .thumbnail)
        
        // parse videoId
        let resourceIdContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .resourceId)
        self.videoId = try resourceIdContainer.decode(String.self, forKey: .videoId)
        
    }
}
