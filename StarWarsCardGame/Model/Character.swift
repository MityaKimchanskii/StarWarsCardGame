//
//  Character.swift
//  StarWarsCardGame
//
//  Created by Mitya Kim on 1/18/22.
//

import UIKit

class Character {
    
    let name: String
    let photo: UIImage?
    let faction: String
    
    init(name: String, photo: UIImage?, faction: String) {
        self.name = name
        self.photo = photo
        self.faction = faction
    }
}

extension Character: Equatable {
    static func == (lhs: Character, rhs: Character) -> Bool {
        return lhs.name == rhs.name && lhs.photo == rhs.photo && lhs.faction == rhs.faction
    }
}
