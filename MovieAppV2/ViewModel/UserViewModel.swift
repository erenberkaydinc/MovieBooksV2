//
//  UserViewModel.swift
//  MovieAppV2
//
//  Created by Eren Berkay Dinç on 9.06.2022.
//

import Foundation

class UserViewModel : ObservableObject {
    
    @Published var user : [UsersViewModel]?
    

    @Published var favoriteMoviesArray = [FavoriteFilm]()
    
    
}


struct UsersViewModel {
    
    let film : Film
    
    var favoriteMovies : [Film]

    var poster : String {
        film.poster
    }
    
    var year : String {
        film.year
    }
    
    var ImdbId : String {
        film.imdbID
    }
    
}
