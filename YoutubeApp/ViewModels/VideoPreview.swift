//
//  VideoPreview.swift
//  YoutubeApp
//
//  Created by Edward Phan on 2021-11-14.
//

import Foundation
import Alamofire

class VideoPreview: ObservableObject {
    @Published var thumbnailData = Data()
    @Published var title: String
    @Published var date: String
    
    var video: Video
    
    init(video: Video) {
        
        // Set video and title
        self.video = video
        self.title = video.title
        
        // Set date
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, YYYY"
        
        self.date = df.string(from: video.published)
        
        // Download image data
        guard video.thumbnail != "" else { return }
        
        // Check cache before downloading data
        if let cachedData = CacheManager.getVideoCache(video.thumbnail) {
            // Set thumbnail data from cacheData
            thumbnailData = cachedData
            return
        }
        
        // Get an URL object from the thumbnail
        guard let url = URL(string: video.thumbnail) else { return }
        
        // Create the request
        AF.request(url)
            .validate()
            .responseData { response in
                if let data = response.data {
                    
                    // Save the data in the cache
                    CacheManager.setVideoCache(video.thumbnail, data)
                    
                    // Set the image
                    DispatchQueue.main.async {
                        self.thumbnailData = data
                    }
                }
            }
    }
}
