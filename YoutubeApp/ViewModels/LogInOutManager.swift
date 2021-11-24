//
//  LogInOutManager.swift
//  YoutubeApp
//
//  Created by Edward Phan on 2021-11-23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
import GoogleSignIn

class LogInOutManager: NSObject, ObservableObject {
    
    enum State {
        case loggedIn
        case loggedOut
    }
    
    @Published var state: State = .loggedOut
    
    
    func logIn() {
        let config = GIDConfiguration.init(clientID: Constants.CLIENT_ID_FIREBASE)
        GIDSignIn.sharedInstance.signIn(with: config, presenting: (UIApplication.shared.windows.first?.rootViewController)!) { (result, error) in
                guard error == nil else {
                    print(error!.localizedDescription)
                    return
                }
                guard let authentication = result?.authentication else { return }
                let credentials = GoogleAuthProvider.credential(withIDToken: authentication.idToken!, accessToken: authentication.accessToken)
                
                // Sign in to Firestore
            Auth.auth().signIn(with: credentials) { (result, error) in
                if let error = error {
                    print("cannot log into Firestore \(error)")
                }
                print("successfully logged int to Firestore")
                self.state = .loggedIn
            }
        }
    }
    
    func logOut() {
        do {
            try Auth.auth().signOut()
            self.state = .loggedOut
        } catch {
            print(error.localizedDescription)
        }
    }
}
