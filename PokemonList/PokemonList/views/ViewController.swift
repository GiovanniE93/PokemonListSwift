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

    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.prefetchDataSource = self
        tableView.register(PokemonListTableViewCell.self, forCellReuseIdentifier: "PokemonListCell")
        view.addSubview(tableView)
        
    }
    
    private func fetchPokemons() {
        
        parser.parsePokemonList(urlString: nextURL, onSuccess: {
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

extension ViewController : UITableViewDataSource, UITableViewDelegate {
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected pokemon: \(pokemons[indexPath.item].name!) ")
        print("URL: \(pokemons[indexPath.item].url!)")
        parser.parsePokemonDetails(named: pokemons[indexPath.item].name!, onSuccess: {
            data in
            print("\(data.name!) fetched details")
//            dovreei lanciare la view dei dettagli
        }, onError: { error in
            print("[PARSER] error during the request! \(error.localizedDescription)")
        })
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
}

private extension ViewController {
    func isLoadingCell(for indexPath: IndexPath) -> Bool {
        return indexPath.item >= pokemons.count / 3
    }
    
    func visibleIndexPathToReload(intersecting indexPaths: [IndexPath]) -> [IndexPath] {
        let indexPathsForVisibleRows = tableView.indexPathsForVisibleRows ?? []
            let indexPathsIntersection = Set(indexPathsForVisibleRows).intersection(indexPaths)
            return Array(indexPathsIntersection)
    }
}

extension ViewController : UITableViewDataSourcePrefetching {
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        if indexPaths.contains(where: isLoadingCell) {
            fetchPokemons()
        }
    }
    
    
}
