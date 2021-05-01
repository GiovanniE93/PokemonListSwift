//
//  PokemonDetailsService.swift
//  PokemonList
//
//  Created by Giovanni Erpete on 30/04/21.
//

import Foundation

class PokemonDetailsService {
    
    private static let pokemonDetailsSections : [String] = ["Abilità",
    "Esperienza di base",
    "Specie",
    "Presente nei giochi",
    "Statistiche",
    "Tipologie"
    ]
    
    public static func getSections() -> [String] {
        return pokemonDetailsSections
    }
    
}
