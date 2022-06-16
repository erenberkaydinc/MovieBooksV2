//
//  Auth.swift
//  TestAuthApp
//
//  Created by Eren Berkay Dinç on 10.06.2022.
//

import Foundation
import Parse

class Authenticator: ObservableObject {
    
  @Published var needsAuthentication: Bool
  @Published var isAuthenticating: Bool
  let user = PFUser.current()
    
  init() {
      
      
      if user != nil {
          self.needsAuthentication = false
          self.isAuthenticating = false
      }else {
          self.needsAuthentication = true
          self.isAuthenticating = false
      }
  }

  func login(username: String, password: String) {
    self.isAuthenticating = true
    // emulate a short delay when authenticating
        
        PFUser.logInWithUsername(inBackground: username, password: password){
            (user: PFUser?, error: Error?) -> Void in
                      if user != nil {
                          //self.message = Message(title:"Successful",text: "Logged in")
                          self.isAuthenticating = false
                          self.needsAuthentication = false
                          
                      } else {
                          //self.message = Message(title:"Error",text: error?.localizedDescription ?? "")
                          self.isAuthenticating = false
                          self.needsAuthentication = true
                      }
        }
    
  }
    
    
  func signUp(username: String, password: String) {
      
      
      self.isAuthenticating = true
      
      // emulate a short delay when authenticating
      
      let user = PFUser()
      user.username = username
      user.password = password
      //user["Favorite Movies"] = "Test"
    
      user.signUpInBackground { success, error in
          
          if let error = error {
              print(error.localizedDescription )
              self.isAuthenticating = false
              self.needsAuthentication = true
              
              
              
          }else {
              
              self.isAuthenticating = false
              self.needsAuthentication = false
              
          }
          
      }
      
    }

  func logout() {
    
      
      PFUser.logOutInBackground { error in
          if error != nil {
              print(error?.localizedDescription ?? "something went wrong")
              self.needsAuthentication = false
          }else{
              self.needsAuthentication = true
          }
          
          
      }
    
      
  }
}
