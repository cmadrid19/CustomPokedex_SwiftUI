//
//  PokemonDetail.swift
//  RegistrationApi
//
//  Created by Maxim Macari on 10/11/2020.
//

import SwiftUI

struct PokemonDetail: View {
    
    @ObservedObject var dataTypes = JsonTypes()
    
    var pokemon: Pokemon
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    
    private let colorsImageBorder = [
        Color("image-border-color1").opacity(0.9),
        Color("image-border-color2").opacity(0.9)
    ]
    
    private let colorsCardBorder = [
        Color("card-border-color1"),
        Color("card-border-color2")
    ]
    
    
    var body: some View {
        
        //Card Shape
        
        
        //Colors for each type
        VStack(alignment: .leading, spacing: 8){
            
            VStack{
                
                //Head Card
                HStack(spacing: 0){
                    Text("\(pokemon.name.english)")
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(Color("text-color"))
                        .minimumScaleFactor(0.5)
                        
                    Spacer(minLength: 50)
                    
                    Text("\(pokemon.base.hp) HP")
                        .font(.body)
                        .fontWeight(.bold)
                        .foregroundColor(Color.red)
                        
                    HStack(spacing: -10){
                        
                        ForEach(pokemon.type, id: \.self) { type in
                            Image(type.lowercased())
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 42, height: 42)
                        }
                    }
                    
                }
                .scaledToFit()
                .lineLimit(1)
                .allowsTightening(true)
                .padding([.top, .horizontal],30)
                .padding(.bottom, -6)
                
                
                VStack{
                    ImageLoader(nombrePokmon: pokemon.name.english)
                        .aspectRatio(contentMode: .fit)
                        //Same padding as width border
                        .padding(8)
                        .border(LinearGradient(gradient: Gradient(colors: colorsImageBorder), startPoint: .topLeading, endPoint: .bottomTrailing), width: 8)
                }
                .frame(width: width * 0.7)
                
                VStack{
                    HStack{
                        Text("Attack")
                        Spacer()
                        Text("\(pokemon.base.attack)")
                    }
                    HStack{
                        Text("Defense")
                        Spacer()
                        Text("\(pokemon.base.defense)")
                    }
                    HStack{
                        Text("Sp attack")
                        Spacer()
                        Text("\(pokemon.base.spAttack)")
                    }
                    HStack{
                        Text("SP defense")
                        Spacer()
                        Text("\(pokemon.base.spDefense)")
                    }
                }
                .foregroundColor(Color("text-color"))
                .padding([.horizontal, .bottom], 40)
                .font(.title2)
                
                
            }
            .padding(6)
            .frame(maxWidth: .infinity)
            .background(getTypeColor())
            
            
           
        }
        .border(LinearGradient(gradient: Gradient(colors: colorsCardBorder), startPoint: .topLeading, endPoint: .bottomTrailing), width: 16)
        .cornerRadius(20)
        .frame(width: width * 0.9)
        
        
        
    }
    
    private func getTypeColor() -> LinearGradient{
        var colors = [Color]()
        for x in 0..<pokemon.type.count{
            if let hexString = dataTypes.types.first(where:{ $0.english == self.pokemon.type[x]}){
                colors.append(Color(hex: "#\(hexString.color)").opacity(0.86))
            }
        }
        return LinearGradient(gradient: Gradient(colors: colors), startPoint: .topLeading, endPoint: .bottomTrailing)
    }
   
}



struct PokemonDetail_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetail(pokemon: test)
    }
}



var test = Pokemon(id: 611,
                   name: Name(english: "Fraxure", japanese: "オノンド", chinese: "斧牙龙", french: "Incisache"),
                   type: ["Dragon", "Fire"],
                   base: Base(hp: 66, attack: 117, defense: 70, spAttack: 40, spDefense: 50, speed: 67))


