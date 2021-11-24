//
//  YoutubeAppApp.swift
//  YoutubeApp
//
//  Created by Edward Phan on 2021-11-12.
//

import SwiftUI
import Firebase

@main
struct YoutubeAppApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            Launch()
                .environmentObject(LogInOutManager())
        }
    }
}
