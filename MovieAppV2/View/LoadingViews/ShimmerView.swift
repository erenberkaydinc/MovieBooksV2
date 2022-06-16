//
//  ShimmerView.swift
//  MoviesBook
//
//  Created by Eren Berkay Dinç on 7.06.2022.
//


import SwiftUI

@available(iOS 13.0, *)
public struct ShimmerView: View {
    
    private struct Constants {
        static let duration: Double = 0.9
        static let minOpacity: Double = 0.25
        static let maxOpacity: Double = 1.0
        static let cornerRadius: CGFloat = 2.0
    }
    
    @State private var opacity: Double = Constants.minOpacity
    
    public init() {}
    
    public var body: some View {
       
        RoundedRectangle(cornerRadius: Constants.cornerRadius)
            .fill(Color.gray)
            .opacity(opacity)
            .transition(.opacity)
            .onAppear {
                let baseAnimation = Animation.easeInOut(duration: Constants.duration)
                let repeated = baseAnimation.repeatForever(autoreverses: true)
                withAnimation(repeated) {
                    self.opacity = Constants.maxOpacity
                }
        }
        
        
        
        
    }
}

#if DEBUG
@available(iOS 13.0, *)
public struct ShimmerView_Previews: PreviewProvider {
    public static var previews: some View {
       
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

#endif
