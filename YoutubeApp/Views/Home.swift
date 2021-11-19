//
//  Home.swift
//  YoutubeApp
//
//  Created by Edward Phan on 2021-11-18.
//

import SwiftUI

let backgroundColor = Color(red: 31 / 255, green: 33 / 255, blue: 36 / 255)

struct Home: View {
    
    @StateObject var model = VideoModel()

    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(model.videos, id:\.videoId) { video in
                    // Display a video row for each video
                    VideoRow(videoPreview: VideoPreview(video: video))
                        // Add padding between the rows
                        .padding()
                }
            }
            .padding(.top, 10)
        }
        // set text color to white against the backgroundColor
        .foregroundColor(.white)

        // set backgroundColor to our backgroundColor
        .background(backgroundColor.edgesIgnoringSafeArea(.all))
    }
    
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
