//
//  YoutubeVideoPlayer.swift
//  YoutubeApp
//
//  Created by Edward Phan on 2021-11-16.
//

import SwiftUI
import WebKit

struct YoutubeVideoPlayer: UIViewRepresentable {
    
    var video: Video
    
    func makeUIView(context: Context) -> some UIView {
        // Create the webView
        let view = WKWebView()
        
        // Set the background color for the view
        view.backgroundColor = UIColor(backgroundColor)
        
        // Create URL for video
        let embedUrlString = Constants.YT_EMBED_URL + video.videoId
        
        // Load the video into WebView
        let url = URL(string: embedUrlString)
        let request = URLRequest(url: url!)
        view.load(request)
        
        // Return Webview
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}

struct YoutubeVideoPlayer_Previews: PreviewProvider {
    static var previews: some View {
        YoutubeVideoPlayer(video: Video())
    }
}
