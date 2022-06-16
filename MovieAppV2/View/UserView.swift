//
//  UserViewV2.swift
//  MovieAppV2
//
//  Created by Eren Berkay Dinç on 10.06.2022.
//

import SwiftUI
import Parse

struct UserView: View {
    
    @EnvironmentObject var authenticator: Authenticator
    
    let user = PFUser.current()
    
    @State private var username: String = ""
    @State private var password: String = ""
    
    var body: some View {
        
        
            //authenticated
            NavigationView{
            
            VStack{
                Image("spidermanFace")
                    .resizable()
                    .offset(y:-10)
                    .frame(width: 150, height: 150)
                Text("Hello")
                    .bold().font(Font.system(size: 30))
                    .fontWeight(.bold)
                Text(user?.username ?? "No username")
                    .font(Font.system(size: 30))
                    .fontWeight(.light)
                    .padding(.bottom)
                
                Button("Log out"){
                    authenticator.logout()
                    
                }
                
            }.navigationTitle("Authenticated")
            
           
        }

        
    }
}
    




struct UserViewV2_Previews: PreviewProvider {
    static var previews: some View {
        UserView()
    }
}
