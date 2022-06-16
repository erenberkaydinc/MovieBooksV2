//
//  SkeletonDetailView.swift
//  MoviesBook
//
//  Created by Eren Berkay Dinç on 7.06.2022.
//

import SwiftUI

struct SkeletonDetailView: View {
    var body: some View {
        VStack{

            VStack {
               
                    ShimmerView()
                        .frame(width: 250, height: 300,alignment: .center)
                        .clipShape(Circle())
                    
                    VStack{
                        ShimmerView()
                            .frame(height:   10)
                            .padding()
                        ShimmerView()
                            .frame(height:   75).padding([.trailing,.leading],150)
                        ShimmerView()
                            .frame(height:   13)
                            .padding()
                        ShimmerView()
                            .frame(height:   13)
                            .padding()
                        ShimmerView()
                            .frame(height:   13).padding()
                        ShimmerView()
                            .frame(height:   13)
                            .padding()
                    
                    
                    }

            .padding()
        
        }
        }
    }
}

struct SkeletonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SkeletonDetailView()
    }
}
