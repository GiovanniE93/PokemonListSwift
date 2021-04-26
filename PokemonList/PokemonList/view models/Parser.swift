//
//  Parser.swift
//  PokemonList
//
//  Created by Giovanni Erpete on 26/04/21.
//

import Foundation

struct Parser {
    
    let host = "https://pokeapi.co/api/v2/"
    
    func parsePokemonList(endpoint : String?, urlString: String?, onSuccess: @escaping (PokemonListData) -> Void, onError: @escaping (Error) -> Void) {
        var url : URL?
        if let myUrl = urlString{
            url = URL(string: myUrl)
        } else {
            if let myEndpoint = endpoint {
                url = URL(string: host+myEndpoint)
            }
        }
        
        URLSession.shared.dataTask(with: url!) {
            data, response, error in
            if let errore = error {
                onError(errore)
                return
            }
            if let myData = data{
                do {
                    let result = try JSONDecoder().decode(PokemonListData.self, from: myData)
                    onSuccess(result)
                } catch {
                    print("Errore durante la conversione")
                }
            }
        }.resume()
    }
    
}
