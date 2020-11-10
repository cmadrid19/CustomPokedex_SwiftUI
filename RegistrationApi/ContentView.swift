//
//  ContentView.swift
//  RegistrationApi
//
//  Created by Maxim Macari on 09/11/2020.
//

import SwiftUI

struct ContentView: View {
    
  
    var body: some View {
        
        NavigationView{
            
            Home()
                .navigationBarTitle("Pokemons")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    /*
     TODO
     2. Catche Images
     3. Types filtering
     4. SearchView
     */
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


