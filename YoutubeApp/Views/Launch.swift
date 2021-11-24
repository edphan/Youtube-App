//
//  Launch.swift
//  YoutubeApp
//
//  Created by Edward Phan on 2021-11-23.
//

import SwiftUI

struct Launch: View {
    
    @EnvironmentObject var model: LogInOutManager
    
    var body: some View {
        if model.state == .loggedIn {
            Home()
        } else {
            Button(action: model.logIn) {
                Text("Sign in with Google")
            }
        }
    }
}

struct Launch_Previews: PreviewProvider {
    static var previews: some View {
        Launch()
    }
}
