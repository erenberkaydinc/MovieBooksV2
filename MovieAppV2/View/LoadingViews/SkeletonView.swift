//
//  SkeletonView.swift
//  MoviesBook
//
//  Created by Eren Berkay Dinç on 7.06.2022.
//

import SwiftUI

struct SkeletonView: View {
    var body: some View {
        VStack{
        List(1..<6) { row in

            VStack {
                HStack{
                    ShimmerView()
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                    
                    VStack{
                        ShimmerView()
                            .frame(height:   20)
                        ShimmerView()
                            .frame(height:   10)
                    }
                    
                }

            .padding()
        
        }
        }
        }
        
    }
}

struct SkeletonView_Previews: PreviewProvider {
    static var previews: some View {
        SkeletonView()
    }
}
