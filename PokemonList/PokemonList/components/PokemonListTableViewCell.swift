//
//  PokemonListTableViewCell.swift
//  PokemonList
//
//  Created by Giovanni Erpete on 26/04/21.
//

import UIKit

class PokemonListTableViewCell: UITableViewCell {
    
    let nameLabel = UILabel(frame: CGRect(x: 30, y: 0, width: 100, height: 30))

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupLabel(_ pokemonName : String) {
        nameLabel.text = pokemonName
        nameLabel.textColor = .black
        addSubview(nameLabel)
    }

}
