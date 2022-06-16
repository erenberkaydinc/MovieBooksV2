//
//  DetailView.swift
//  MoviesBook
//
//  Created by Eren Berkay Dinç on 7.06.2022.
//

import SwiftUI
import Parse
import SwiftyJSON

struct DetailView: View {
    
    let imdbId : String
    
    @ObservedObject var filmDetailViewModel = FilmDetailViewModel()
    
    @State private var isShowingAlert = false
    
    @EnvironmentObject var authenticator: Authenticator
    @Environment(\.dismiss) var dismiss

    
    @StateObject var userVM = UserViewModel()
    
    var currentUser = PFUser.current()
    
    
    
    var body: some View {
        
        NavigationView{
            
        
        VStack{
            if filmDetailViewModel.filmDetail?.poster != nil {
                
                
                VStack(alignment: .center,spacing: 5){
                    
                    
                    
                    SpecialImageView(url: filmDetailViewModel.filmDetail?.poster ?? "")
                        .frame(width: 250, height: 300,alignment: .center)
                    
                    Text(filmDetailViewModel.filmDetail?.title ?? "").font(.title).bold().padding(.horizontal).multilineTextAlignment(.center)
                    
                    Text(filmDetailViewModel.filmDetail?.year ?? "") .font(.system(size: 15)).bold().padding([.top, ], 2)
                    
                    if ((filmDetailViewModel.filmDetail!.metascore.contains("/")) ) {
                      
                        
                        
                    }else{
                        Text("Meta Score").padding([.top,.bottom ], 5)
                        
                        Text(filmDetailViewModel.filmDetail?.metascore ?? "") .font(.system(size: 60)).bold().padding([.top,.bottom ], 5).foregroundColor(.accentColor)
                    }

                   
                    
                    Text("Director:\(filmDetailViewModel.filmDetail?.director ?? "")") .font(.subheadline).padding([.top, ], 10)
                    
                    
                    
                    Text(filmDetailViewModel.filmDetail?.plot ?? "")
                        .font(.body)
                        .multilineTextAlignment(.center).padding()
                        .fixedSize(horizontal: false, vertical: true)
                    
                    Text("Writer: \(filmDetailViewModel.filmDetail?.writer ?? "")")
                        .font(.caption)
                        .multilineTextAlignment(.center).padding([.top,.bottom ],15)
                    
                    Text("Awards: \(filmDetailViewModel.filmDetail?.awards ?? "")")
                        .font(.caption)
                        .multilineTextAlignment(.center).padding([.top,.bottom ],15)
                    
                   
                }.offset(y:UIScreen.main.bounds.height * -0.11)
                   
                
                
            } else {
                SkeletonDetailView().offset(y:UIScreen.main.bounds.height * -0.11)
            }
            
            
            
        }
        .alert("Added", isPresented: $isShowingAlert) {
              // Login to the bank
            } message: {
              Text("\(filmDetailViewModel.filmDetail?.title ?? "The Movie") added to your Fav List!")
        }
                
                

        .onAppear(perform:{
            Task.init{
            
                self.filmDetailViewModel.getFilmDetail(imdbId: imdbId)
                
                
               
                
            }
        })
        
        
            
    }.toolbar {
        
        if (authenticator.needsAuthentication){
           
        }else{
            
            
           
            Button {
                let newFavoriteMovie = PFObject(className: "Favorites")
                               newFavoriteMovie["ImdbId"] = imdbId
                               newFavoriteMovie["userId"] = currentUser?.objectId
                               newFavoriteMovie["title"] = filmDetailViewModel.filmDetail?.title
                               newFavoriteMovie["year"] = filmDetailViewModel.filmDetail?.year
                               newFavoriteMovie["poster"] = filmDetailViewModel.filmDetail?.poster
                               
                               newFavoriteMovie.saveInBackground { (success, error) in
                                          if(success){
                                              print("The Movie has been saved")
                                          }else{
                                              print("An error has occurred!")
                                          }
                                      }
                isShowingAlert = true
                dismiss()
                
            } label: {
                
                //if the user liked the movie then show pink circle filled
                //if the user not liked the movie then show pink circle but unfilled heart
                HStack{
                    Image(systemName:"heart.circle.fill").font(.title2).foregroundColor(.pink)
                    Text("Like").foregroundColor(.pink)
                }
            }
        }
        
        
    }
    }
    

    
    

}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(imdbId: "tt3896198")
    }
}
