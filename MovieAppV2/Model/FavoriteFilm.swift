//
//  FavoriteFilm.swift
//  MovieAppV2
//
//  Created by Eren Berkay Dinç on 11.06.2022.
//

import Foundation

struct FavoriteFilm : Codable {
    //Decodable - Encodable = Codable
    
    let title : String
    let year : String
    var ImdbId : String
    let poster : String
    
    private enum CodingKeys : String, CodingKey {
        case title  = "Title"
        case year = "Year"
        case ImdbId = "ImdbId"
        case poster = "Poster"
    }
    

}
