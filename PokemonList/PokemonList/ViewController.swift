//
//  ViewController.swift
//  PokemonList
//
//  Created by Giovanni Erpete on 26/04/21.
//

import UIKit

class ViewController: UIViewController {

    let parser = Parser()
    override func viewDidLoad() {
        super.viewDidLoad()
        parser.parsePokemonList("pokemon/", onSuccess: {list in
            if let myArray = list.results {
                for elem in myArray {
                    print("elem: \(elem.name)")
                }
            }
        }, onError: { error in
            print(error.localizedDescription)
        })
        // Do any additional setup after loading the view.
    }


}

