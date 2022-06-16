//
//  MovieAppV2App.swift
//  MovieAppV2
//
//  Created by Eren Berkay Dinç on 9.06.2022.
//

import SwiftUI
import Parse

@main struct MovieAppV2App: App {
    
    let persistenceController = PersistenceController.shared
    
    @StateObject var authenticator = Authenticator()

    var body: some Scene {
        
        WindowGroup {
            
            RootView().environmentObject(authenticator) // Authenticator
                 .onAppear(perform: UIApplication.shared.addTapGestureRecognizer) // Dismiss Keyboard
               
           
            
            
        }
        
    }
    
    init() {
           
            //Here is your Parse or Back4App configuration Keys
            // Prepares Parse configuration
            let parseConfig = ParseClientConfiguration {
                $0.applicationId = "yourAppId" // Your AppID
                $0.clientKey = "yourClientKey" // Your ClientKey
                $0.server = "https://parseapi.back4app.com/" // Parse Server URL
            }
            
            // Initializes Parse with the created Configuration
            Parse.initialize(with: parseConfig)
            
           
            
        
        }
    
    
    
}


//MARK: - Dismiss Keyboard

extension UIApplication {
    func addTapGestureRecognizer() {
        guard let window = windows.first else { return }
        let tapGesture = UITapGestureRecognizer(target: window, action: #selector(UIView.endEditing))
        tapGesture.requiresExclusiveTouchType = false
        tapGesture.cancelsTouchesInView = false
        tapGesture.delegate = self
        window.addGestureRecognizer(tapGesture)
    }
}

extension UIApplication: UIGestureRecognizerDelegate {
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true // set to `false` if you don't want to detect tap during other gestures
    }
}
