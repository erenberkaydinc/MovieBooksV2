//
//  ContentView.swift
//  MovieAppV2
//
//  Created by Eren Berkay Dinç on 9.06.2022.
//

import SwiftUI
import Parse

struct ContentView: View {
    
 
    
  //IF USER IS NOT AUTHENTICATED ONLY CAN SEE THESE TABS
    
    var body: some View {
        
      
            
            // Only Movies Tab
           FilmListView()
            
            
         
        }
}






struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
