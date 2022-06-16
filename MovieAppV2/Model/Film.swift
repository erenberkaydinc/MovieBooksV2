//
//  Film.swift
//  MoviesBook
//
//  Created by Eren Berkay Dinç on 7.06.2022.
//

import Foundation

struct Film : Codable {
    //Decodable - Encodable = Codable
    
    let title : String
    let year : String
    let imdbID : String
    let type : String
    let poster : String
    
    private enum CodingKeys : String, CodingKey {
        case title  = "Title"
        case year = "Year"
        case imdbID = "imdbID"
        case type = "Type"
        case poster = "Poster"
    }
    

}

//response [0].Search[]

struct RespondMovies : Codable {
    
    // Search: []
    let films : [Film]
    
    private enum CodingKeys : String, CodingKey {
        case films = "Search"
    }
    
}
