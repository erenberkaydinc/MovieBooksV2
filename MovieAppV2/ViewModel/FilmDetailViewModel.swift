//
//  FilmDetailViewModel.swift
//  MoviesBook
//
//  Created by Eren Berkay Dinç on 7.06.2022.
//

import Foundation

class FilmDetailViewModel: ObservableObject {
    
    @Published var filmDetail : FilmDetailsViewModel?
    
    let downloaderClient = DownloaderClient()
    
    func getFilmDetail(imdbId: String){
        downloaderClient.downloadFilmDetail(imdbId: imdbId) { result in
            
            switch result {
            case .failure(let Error):
                print(Error)
            
            case .success(let filmDetail):
                
                DispatchQueue.main.async {
                self.filmDetail = FilmDetailsViewModel(detail: filmDetail!)
                }
            }
            
    }
    
}
}

struct FilmDetailsViewModel {
    
    let detail : FilmDetail
    
    
    var title : String {
        detail.title
    }
    
    var poster : String {
        detail.poster
    }
    
    var year : String {
        detail.year
    }
    
    var director : String {
        detail.director
    }
    
    var writer : String {
        detail.writer
    }
    
    
    var awards : String {
        detail.awards
    }
    
    var plot : String {
        detail.plot
    }
    
    var metascore : String {
        detail.metascore
    }
    
    var  imdbID : String {
        detail.imdbID
    }
    
}

