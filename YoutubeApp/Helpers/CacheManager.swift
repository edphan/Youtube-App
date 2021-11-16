//
//  CacheManager.swift
//  YoutubeApp
//
//  Created by Edward Phan on 2021-11-14.
//

import Foundation

class CacheManager {
    
    static var cache = [String: Data]()
    
    static func setVideoCache(_ url: String, _ data: Data?) {
        // Store the imageData with the Url as key
        cache[url] = data
    }
    
    static func getVideoCache(_ url: String) -> Data? {
        // Try and get the data for the specified URL
        return cache[url]
    }
}
