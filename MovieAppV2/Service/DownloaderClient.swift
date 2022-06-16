//
//  DownloaderClient.swift
//  MoviesBook
//
//  Created by Eren Berkay Dinç on 7.06.2022.
//

import Foundation
import Parse

class DownloaderClient {
    
    //get params as a parameter
    // https://www.omdbapi.com/?s=titan&apikey=blablabla
    //change the api key to yours
    let apikey = "yourapikeyblabla"
    
    func downloadFilms(search:String, completion: @escaping ((Result<[Film]?,DownloaderError>) -> Void)) {
        
        guard let url = URL(string: "https://www.omdbapi.com/?s=\(search)&apikey=\(apikey)") else {
            return completion(.failure(.wrongURL))
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data , error  == nil else {
                return completion(.failure(.cantFetchData))
            }
            
            guard let filmResponse = try? JSONDecoder().decode(RespondMovies.self, from: data) else {
                return completion(.failure(.cantProcessData))
            }
            
            completion(.success(filmResponse.films))
            
            
        }.resume()
        
        
        
    }
    
    func downloadFilmDetail(imdbId:String,completion: @escaping (Result<FilmDetail?,DownloaderError>) -> Void ){
        
        guard let url = URL(string: "https://www.omdbapi.com/?i=\(imdbId)&apikey=\(apikey)") else {
            return completion(.failure(.wrongURL))
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
           
              
                    guard let data = data , error == nil else{
                        return completion(.failure(.cantFetchData))
                    }
                    
                    guard let fetchMovieDetail = try? JSONDecoder().decode(FilmDetail.self, from: data) else {
                        return completion(.failure(.cantProcessData))
                    }
                        
                    completion(.success(fetchMovieDetail))
                
           
            
        }.resume()
        
    }
    
    

    
}

enum DownloaderError : Error {
    case wrongURL
    case cantFetchData
    case cantProcessData
}
