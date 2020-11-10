//
//  Home.swift
//  RegistrationApi
//
//  Created by Maxim Macari on 10/11/2020.
//

import SwiftUI

struct Home: View {
    
    @ObservedObject var dataTypes = JsonTypes()
    @ObservedObject var dataPokemons = JsonPokemons()
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    
    var body: some View {
        
        //Searchbar
        
        ScrollView(.vertical, showsIndicators: false, content: {
            LazyVGrid(columns: columns, spacing: 10, content:{
                ForEach(dataPokemons.pokemons, id: \.id){ pokemon in
                    NavigationLink(
                        destination: PokemonDetail(pokemon: pokemon),
                        label: {
                            PokemonCell(pokemon: pokemon)
                        })
                    
                }
            })
        })
    }
}

