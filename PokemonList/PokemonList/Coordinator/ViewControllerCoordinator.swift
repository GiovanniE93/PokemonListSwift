//
//  ViewControllerCoordinator.swift
//  PokemonList
//
//  Created by Giovanni Erpete on 28/04/21.
//

import UIKit

class ViewControllerCoordinator : Coordinator {
    
    private let presenter : UINavigationController
    private var homeViewController : ViewController?
  
    init(presenter: UINavigationController) {
        self.presenter = presenter
    }
    func start() {
        let homeVC = ViewController()
        homeVC.delegate = self
        homeViewController = homeVC
        presenter.pushViewController(homeVC, animated: true)
    }
}

extension ViewControllerCoordinator : ViewControllerProtocol {
    
    func watchPokemonDetails(_ pokemonDetails: PokemonDetailsData) {
        let pokemonDetailsVC = PokemonDetailsViewController()
        pokemonDetailsVC.pokemonDetails = pokemonDetails
        presenter.pushViewController(pokemonDetailsVC, animated: true)
    }
    
}
