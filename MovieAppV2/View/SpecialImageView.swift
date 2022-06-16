//
//  SpecialImageView.swift
//  MoviesBook
//
//  Created by Eren Berkay Dinç on 7.06.2022.
//

import SwiftUI

struct SpecialImageView: View {
    
    let url : String
    @ObservedObject var imageDownloaderClient = ImageDownloaderClient()
    
    init(url:String){
        self.url = url
        self.imageDownloaderClient.downloadeImage(url:self.url)
    }
    
    var body: some View {
        
        if let data = self.imageDownloaderClient.downloadedImage {
            return Image(uiImage: UIImage(data: data)!)
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
                .overlay(Circle().stroke(.blue,lineWidth: 3))
                
            
        }else {
           
           return Image("Portre")
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
                .overlay(Circle().stroke(.blue,lineWidth: 3))
             
        }
        
        
    }
}

struct SpecialImageView_Previews: PreviewProvider {
    static var previews: some View {
        SpecialImageView(url:"https://m.media-amazon.com/images/M/MV5BMDdmZGU3NDQtY2E5My00ZTliLWIzOTUtMTY4ZGI1YjdiNjk3XkEyXkFqcGdeQXVyNTA4NzY1MzY@._V1_SX300.jpg")
    }
}
