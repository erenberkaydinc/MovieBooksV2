//
//  ImageDownloaderClient.swift
//  MoviesBook
//
//  Created by Eren Berkay Dinç on 7.06.2022.
//

import Foundation

class ImageDownloaderClient:ObservableObject {
    
    @Published var downloadedImage : Data?
    
    
    
    func downloadeImage(url:String) {
        
        guard let imageUrl = URL(string:url) else {
            return
        }
        
        URLSession.shared.dataTask(with: imageUrl) { data, response, error in
            
            guard let data = data , error == nil else {
                return
            }
            DispatchQueue.main.async {
                
                self.downloadedImage = data
                
                
            }
            
           
           
            
        }.resume()
        
    }
    
    
}
