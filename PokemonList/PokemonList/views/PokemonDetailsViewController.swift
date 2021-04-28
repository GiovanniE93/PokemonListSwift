//
//  PokemonDetailsViewController.swift
//  PokemonList
//
//  Created by Giovanni Erpete on 28/04/21.
//

import UIKit

class PokemonDetailsViewController: UIViewController {
    
    var pokemonDetails : PokemonDetailsData?
    
//    elementi nella view
    let image = UIImageView()
    let name = UILabel()
    let horizontalStack = UIStackView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        self.view.backgroundColor = .white
        setupImageWithLabel()
        // Do any additional setup after loading the view.
    }
    
    private func setupNavigationBar() {
        if let name = pokemonDetails?.name {
            self.title = name + " details"
        } else {
            self.title = "Pokemon Details"
        }
    }
    
    private func setupImageWithLabel() {
        image.load(url: URL(string: pokemonDetails!.sprites!.frontDefault!)!)
        image.frame = CGRect(x: view.bounds.midX / 2, y: 100, width: 200, height: 200)
        view.addSubview(image)
        name.frame = CGRect(x: view.bounds.midX / 2, y: image.frame.height + 100, width: 200, height: 50)
        name.font = .systemFont(ofSize: 24, weight: .bold)
        name.textAlignment = .center
        name.textColor = .black
        name.text = pokemonDetails!.name
        view.addSubview(name)
    }
}

