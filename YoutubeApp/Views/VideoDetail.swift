//
//  VideoDetail.swift
//  YoutubeApp
//
//  Created by Edward Phan on 2021-11-18.
//

import SwiftUI

struct VideoDetail: View {
    
    var video: Video
    var date: String {
        // Create formatted Date from video date
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyy"
        return df.string(from: video.published)
        
    }
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            // Display the video title
            Text(video.title)
                .bold()
            
            // Display the date
            Text(date)
                .foregroundColor(.gray)
            
            // Display the video
            YoutubeVideoPlayer(video: video)
                .aspectRatio(CGSize(width: 1280, height: 720), contentMode: .fit)
            
            // Display the video's description
            ScrollView {
                Text(video.description)
            }
        }
        .font(.system(size: 19))
        .padding()
        .padding(.top, 40)
        .background(backgroundColor.edgesIgnoringSafeArea(.all))
    }
}

struct VideoDetail_Previews: PreviewProvider {
    static var previews: some View {
        VideoDetail(video: Video())
    }
}
