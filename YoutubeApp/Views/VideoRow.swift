//
//  VideoRow.swift
//  YoutubeApp
//
//  Created by Edward Phan on 2021-11-18.
//

import SwiftUI

struct VideoRow: View {
    
    @ObservedObject var videoPreview: VideoPreview
    
    @State var isPresenting = false
    @State var imageHeight: CGFloat = 0
    
    var body: some View {
        Button {
            isPresenting = true
        } label: {
            VStack(alignment: .leading, spacing: 10) {
                
                // Display the thumbnail Image
                GeometryReader { geometry in
                    
                    // Create an image from the videoPreview's data
                    Image(uiImage: UIImage(data: videoPreview.thumbnailData) ?? UIImage())
                        .resizable()
                        .scaledToFill()
                        .frame(width: geometry.size.width, height: geometry.size.width * 9 / 16)
                        .clipped()
                        .onAppear {
                            // update image height
                            imageHeight = geometry.size.width * 9 / 16
                        }
                    
                }
                // set height for geometry reader so the geometry reader's height is not collapsed
                .frame(height: imageHeight)
                
                // Display the video title
                Text(videoPreview.title)
                    .bold()
                
                // Display the video date
                Text(videoPreview.date)
                    .foregroundColor(.gray)
            }
            .font(.system(size: 19))
        }
        .sheet(isPresented: $isPresenting) {
            // Display the detail view for the video
            VideoDetail(video: videoPreview.video)
        }

    }
}

struct VideoRow_Previews: PreviewProvider {
    static var previews: some View {
        VideoRow(videoPreview: VideoPreview(video: Video()))
    }
}
