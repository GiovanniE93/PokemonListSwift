//
//  PokemonDetailsViewController.swift
//  PokemonList
//
//  Created by Giovanni Erpete on 28/04/21.
//

import UIKit

class PokemonDetailsViewController: UIViewController {
    
    var pokemonDetails : PokemonDetailsData?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        self.view.backgroundColor = .white
        // Do any additional setup after loading the view.
    }
    
    private func setupNavigationBar() {
        if let name = pokemonDetails?.name {
            self.title = name + " details"
        } else {
            self.title = "Pokemon Details"
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
