//
//  ContentView.swift
//  MoviesBook
//
//  Created by Eren Berkay Dinç on 7.06.2022.
//

import SwiftUI
import Parse

struct FilmListView: View {
    
    @ObservedObject var filmListViewModel : FilmListeViewModel
    @State var searchedMovie = ""
    
    @EnvironmentObject var authenticator: Authenticator

    var authenticatedContentTabBar = AuthenticatedContentView.self
    
    let currentUser = PFUser.current()
    
    
    
    init(){
        self.filmListViewModel = FilmListeViewModel()
        self.filmListViewModel.searchMovie(filmName: "avengers")
        
    }
    
    
    
    var body: some View {
        

                //-NavigationView Start
                NavigationView {
                
                VStack{
                   
                    // --
                    if filmListViewModel.films.count > 0 {
                        
                        Group{
                            HStack{
                                
                                
                                
                                TextField("Search Movie", text: $searchedMovie ,
                                          onCommit: {
                                    self.filmListViewModel.searchMovie(filmName: searchedMovie.trimmingCharacters(in: .whitespacesAndNewlines).addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? searchedMovie)
                                }).textFieldStyle(RoundedBorderTextFieldStyle())
                                
                                
                                Button(action: {
                                    self.filmListViewModel.searchMovie(filmName: searchedMovie.trimmingCharacters(in: .whitespacesAndNewlines).addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? searchedMovie)
                                    
                                }) {
                                    Image(systemName: "magnifyingglass.circle.fill")
                                        .renderingMode(.original)
                                        .font(.largeTitle)
                                }
                                
                                
                                
                            }.padding()
                        }
                        
                        List(filmListViewModel.films , id:\.ImdbId) { film in
                            
                           
                            NavigationLink {
                                DetailView(imdbId: film.ImdbId)
                                
                            } label: {
                                HStack{
                                    SpecialImageView(url: film.poster)
                                        .frame(width: 100, height: 130)
                                    
                                    VStack(alignment: .leading){
                                        Text(film.title)
                                            .font(.title3)
                                            .foregroundColor(.blue)
                                            .bold()
                                        Text(film.year)
                                            .font(.title3)
                                        
                                    }
                                    
                                }
                            }
                            
                            
                            
                        }
                        // --
                    }else {
                        SkeletonView()
                    }
                    
                }
                
                .onTapGesture(count: 2){} // UI is unresponsive without this line. Why?
                .onLongPressGesture(minimumDuration: 0, maximumDistance: 0, pressing: nil, perform: endEditing)

                .navigationTitle(Text("Movies Book")).toolbar {
                    
                    if (authenticator.needsAuthentication){
                        NavigationLink {
                            LoginView()
                        } label: {
                            Text("Login")
                        }
                    }else{
                        
                        NavigationLink {
                            UserView()
                        } label: {
                            Text(currentUser?.username ?? "No username").foregroundColor(.blue)
                        }
                       

                        
                    }
                    
                }
            }
                
    

        
    }
    
    
    
}

extension FilmListView {
    func endEditing() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct FilmListView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        FilmListView()
    }
}
