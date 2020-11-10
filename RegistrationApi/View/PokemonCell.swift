//
//  PokemonCell.swift
//  RegistrationApi
//
//  Created by Maxim Macari on 09/11/2020.
//

import SwiftUI


struct PokemonCell: View {
    
    var pokemon: Pokemon
    
    var body: some View{
        
        VStack(spacing: 8){
            
            ImageLoader(nombrePokmon: pokemon.name.english)
                .aspectRatio(contentMode: .fit)
            
            Text("\(pokemon.name.english)")
                .padding([.horizontal, .bottom], 8)
                .scaledToFit()
                .lineLimit(1)
                .allowsTightening(true)
        }
        .frame(width: 110, height: 135)
    }
}

struct PokemonCell_Previews: PreviewProvider {
    static var previews: some View {
        PokemonCell(pokemon: test)
    }
}


