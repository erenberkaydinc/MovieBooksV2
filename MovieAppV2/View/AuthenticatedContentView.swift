//
//  AuthenticatedContentView.swift
//  MovieAppV2
//
//  Created by Eren Berkay Dinç on 10.06.2022.
//

import SwiftUI

struct AuthenticatedContentView: View {
    
    
    
    @EnvironmentObject var authenticator: Authenticator
    
    @State var selection = 0

    //IF USER IS AUTHENTICATED ONLY CAN ALL THESE TABS
    
    var body: some View {
        
        
        TabView(selection: $selection) {
                
                //First Tab - Movies
               FilmListView()
                    .environmentObject(authenticator)
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Movies")
                        .tag(0)
                }
                //--
                
                //Second Tab
                
                FavoritesView2()
                .tabItem {
                        Image(systemName: "heart")
                        Text("Favorites")
                        
                           
                    }.tag(1)
                //--
                
                //Third Tab
               
                UserView()
                    .environmentObject(authenticator)
                        .tabItem {
                            Image(systemName: "person")
                            Text("User")
                        }.tag(2)
                
                
               
                    
                
                //--
            
            }.accentColor(.blue)
                .onAppear() {
                    
                    UITabBar.appearance().barTintColor = .white
                    
                }
            }
    
}

struct AuthenticatedContentView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticatedContentView()
    }
}
