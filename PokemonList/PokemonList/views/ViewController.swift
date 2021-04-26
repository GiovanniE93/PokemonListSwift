//
//  ViewController.swift
//  PokemonList
//
//  Created by Giovanni Erpete on 26/04/21.
//

import UIKit

class ViewController: UIViewController {

    private var pokemons = [PokemonData]()
    private var nextURL : String?
    private let parser = Parser()
    var tableView = UITableView(frame: UIScreen.main.bounds)
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        super.viewDidLoad()
        self.title = "Pokemon List"
        fetchPokemons()
        setupTableView()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        fetchPokemons()
    }

    private func setupTableView() {
        tableView.dataSource = self
        tableView.register(PokemonListTableViewCell.self, forCellReuseIdentifier: "PokemonListCell")
        view.addSubview(tableView)
        
    }
    
    private func fetchPokemons() {
        parser.parsePokemonList(endpoint: "pokemon/", urlString: nil, onSuccess: {
            data in
            self.nextURL = data.next
            for elem in data.results! {
                self.pokemons.append(elem)
            }
            print(self.pokemons.count)
        }, onError: {
            error in
            print(error)
        })
        self.tableView.reloadData()
    }

}

extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PokemonListCell") as? PokemonListTableViewCell {
            if let pokemonName = pokemons[indexPath.item].name {
                cell.setupLabel(pokemonName)
                return cell
            }
        }
        return UITableViewCell()
    }
    
    
}

