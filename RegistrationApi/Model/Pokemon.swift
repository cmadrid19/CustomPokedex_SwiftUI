//
//  Pokemon.swift
//  RegistrationApi
//
//  Created by Maxim Macari on 09/11/2020.
//

import SwiftUI

// MARK: - WelcomeElement
struct Pokemon: Codable{
   
    var id: Int
    var name: Name
    var type: [String]
    var base: Base
}

// MARK: - Base
struct Base: Codable {
    var hp, attack, defense, spAttack: Int
    var spDefense, speed: Int
    
    enum CodingKeys: String, CodingKey {
        case hp = "HP"
        case attack = "Attack"
        case defense = "Defense"
        case spAttack = "Sp. Attack"
        case spDefense = "Sp. Defense"
        case speed = "Speed"
    }
}

// MARK: - Name
struct Name: Codable {
    var english, japanese, chinese, french: String
}



