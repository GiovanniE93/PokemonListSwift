//
//  PokemonData.swift
//  PokemonList
//
//  Created by Giovanni Erpete on 26/04/21.
//

import Foundation

class PokemonData : Codable {
    var name : String?
    var url : String?
}

class PokemonListData : Codable {
    var count : Int?
    var next : String?
    var previous : String?
    var results : [PokemonData]?
}
