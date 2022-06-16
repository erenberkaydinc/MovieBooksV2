//
//  RootView.swift
//  TestAuthApp
//
//  Created by Eren Berkay Dinç on 10.06.2022.
//

import SwiftUI

struct RootView: View {
    
  @EnvironmentObject var authenticator: Authenticator

  var body: some View {
      
      
      if authenticator.needsAuthentication {
          ContentView()
      }else {
          AuthenticatedContentView().environmentObject(authenticator)
      }
      
      
  }
}

struct RootView_Previews: PreviewProvider {
  static var previews: some View {
    RootView()
      .environmentObject(Authenticator())
  }
}
