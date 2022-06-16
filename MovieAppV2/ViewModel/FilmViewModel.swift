//
//  FilmViewModel.swift
//  MoviesBook
//
//  Created by Eren Berkay Dinç on 7.06.2022.
//

import Foundation
import SwiftUI

class FilmListeViewModel : ObservableObject {
    
   @Published var films = [FilmViewModel]()
    
   let downloaderClient = DownloaderClient()
    
    //MARK: - Search Movie
    func searchMovie(filmName:String){
        downloaderClient.downloadFilms(search: filmName) { result in
            switch result {
            case .failure(let Error) :
                print(Error)
            case .success(let FilmsArray) :
                
                if let FilmsArray = FilmsArray {
                    
                    DispatchQueue.main.async {
                        self.films = FilmsArray.map(FilmViewModel.init)
                    }
                    
                }
                
            }
        }
    }
    
}

struct FilmViewModel {
    
    let film : Film
    
    var title : String {
        film.title
    }
    
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
