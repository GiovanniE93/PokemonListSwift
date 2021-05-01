//
//  PokemonDetailsLabelTableViewCell.swift
//  PokemonList
//
//  Created by Giovanni Erpete on 30/04/21.
//

import UIKit

class PokemonDetailsSingleLabelTableViewCell: UITableViewCell {
    
    var abilities : [Ability?] = [Ability?]()
    let abilityTextLabel = UILabel()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    private func setTextLabel(_ value: String) {
        abilityTextLabel.text = value
        abilityTextLabel.font = .systemFont(ofSize: 16)
        abilityTextLabel.textColor = .black
        abilityTextLabel.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: 20)
        self.addSubview(abilityTextLabel)
    }
    
    func setup(with ability : [Ability?]) {
        var stringAbilities = ""
        self.abilities = ability
        for abil in self.abilities {
            stringAbilities += (abil?.ability?.name ?? "") + ", "
        }
        stringAbilities.remove(at: stringAbilities.index(before: stringAbilities.endIndex))
        let myString = String(stringAbilities.dropLast())
        setTextLabel(myString)
        
    }

    func setup(exp: Int?) {
        if let experience = exp {
            setTextLabel(String(experience))
        }
    }

    func setup(specie: Species?) {
        if let specieName = specie?.name {
            setTextLabel(specieName)
        }
    }
    
    
    
}
