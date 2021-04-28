//
//  PokemonDetailsData.swift
//  PokemonList
//
//  Created by Giovanni Erpete on 28/04/21.
//

import Foundation

struct PokemonDetailsData : Codable {
    var abilitiees : [PokemonAbility]?
    var baseExperience : Int?
    var forms : PokemonBase?
    var gameIndices : [PokemonIndex]?
    var height : Int?
    var id : Int?
    var isDefault : Bool?
    var locationAreaEncounters : String?
    var moves : [PokemonMove]?
    var name : String?
    var order : Int?
    var species : PokemonBase?
//    Mancano sprites
    var stats : [PokemonStatistic]?
    var types : [PokemonType]?
}

struct PokemonBase : Codable {
    var name : String?
    var url : String?
}

struct PokemonAbility : Codable {
    var ability : PokemonBase?
    var isHidden : Bool?
    var slot : Int?
}

struct PokemonIndex : Codable {
    var gameIndex : Int?
    var version : PokemonBase?
}

struct PokemonMove : Codable {
    var name : String?
    var url : String?
    var versionGroupDetail : [PokemonMoveLearnMethod]?
    
}

struct PokemonMoveLearnMethod : Codable {
    var levelLearnedAt : Int?
    var moveLearnedMethod : PokemonBase?
    var versionGroup : PokemonBase?
}

struct PokemonStatistic : Codable {
    var baseStat : Int?
    var effort : Int?
    var stat : PokemonBase?
}

struct PokemonType : Codable {
    var slot : Int?
    var type : PokemonBase?
}
