//
//  FavoritesView.swift
//  MovieAppV2
//
//  Created by Eren Berkay Dinç on 9.06.2022.
//

import SwiftUI
import Parse

struct FavoritesView2: View {
    
    @ObservedObject var filmDetailViewModel = FilmDetailViewModel()
    
    
    
    var currentUser = PFUser.current()
    
    //@State var favoritesArray = [String]()
    
    @StateObject var userVM = UserViewModel()
    
    
    
    
    
    var body: some View {
        
        
        NavigationView {
            
            
            VStack {


                    List(userVM.favoriteMoviesArray, id: \.ImdbId) { film in
                    
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
                
                     
                
               
                
            }.navigationTitle("Favorites")
               
            
                .onAppear{
                    Task.init{
                        
                        fetchData()
                       
                    }
                    
                }
             
            
        }
        
        
        
  }
    
    func fetchData(){
        
        let query = PFQuery(className:"Favorites").whereKey("userId", equalTo: currentUser?.objectId as Any)
        

        query.findObjectsInBackground { (objects: [PFObject]?, error: Error?) in
            if let error = error {
                // Log details of the failure
                print(error.localizedDescription)
            } else if let objects = objects {
                // The find succeeded.
                print("Successfully retrieved \(objects.count) scores.")
                // Do something with the found objects
                
                //print(objects)
                if objects.count > 0 {
                    self.userVM.favoriteMoviesArray.removeAll(keepingCapacity: false)
                    for object in objects {
                        
                       
                       
                        if let poster = object.object(forKey: "poster") as? String {
                            
                            if let ImdbId = object.object(forKey: "ImdbId") as? String {
                                
                                if let title = object.object(forKey: "title") as? String {
                                    
                                    if let year = object.object(forKey: "year") as? String {
                                        
                                        
                                        let favoriteFilm = FavoriteFilm(title: title, year: year, ImdbId: ImdbId, poster: poster)
                                        

                                        
                                       
                                        userVM.favoriteMoviesArray.append(favoriteFilm)
                                        
                                       
                                        
                                    }
                                    
                                }
                                
                            }
                            
                        }
                        
                    }
                    
                }
              
                
            }
        }
    

}
}



struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView2()
    }
}
