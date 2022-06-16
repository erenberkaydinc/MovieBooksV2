//
//  UserView.swift
//  MovieAppV2
//
//  Created by Eren Berkay Dinç on 9.06.2022.
//



import SwiftUI
import Parse

struct LoginView: View {
    
    @EnvironmentObject var authenticator: Authenticator
    
    @State var username = ""
    @State var password = ""
    
    
    var body: some View {
        
        
        
        ZStack {
            Image("background")
                .resizable()
                .opacity(0.3)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            
            
            VStack {
                Image("spidermanFace")
                    .resizable()
                    .offset(y:-15)
                    .frame(width: 150, height: 150)
                Text("Movies Book")
                    .bold().font(Font.system(size: 45))
                    .fontWeight(.bold)
                    
                
                TextField("Username", text: $username).textFieldStyle(RoundedBorderTextFieldStyle()).padding([.horizontal,.bottom])
                    .autocapitalization(.none)
                    .frame( maxWidth:UIScreen.main.bounds.width * 0.8)
                
                
                
                SecureField("Password", text: $password).textFieldStyle(RoundedBorderTextFieldStyle()).padding(.horizontal)
                    .frame( maxWidth:UIScreen.main.bounds.width * 0.8)
                
                HStack{
                    Button("Sign In"){
                        authenticator.login(username: username, password: password)
                    }.buttonStyle(.bordered)
                        .padding(EdgeInsets(top: 15, leading: 0, bottom: 0, trailing: 40))
                    
                    
                    
                    Button("Sign Up"){
                        authenticator.signUp(username: username, password: password)
                    }.buttonStyle(.borderedProminent)
                        .padding(EdgeInsets(top: 15, leading: 40, bottom: 0, trailing: 0))
                }
                
                
                .navigationTitle("Login")
                
                
            }
            
            
            
        }.edgesIgnoringSafeArea(.all)
        
        
        
        
    }
    
    
}


struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

