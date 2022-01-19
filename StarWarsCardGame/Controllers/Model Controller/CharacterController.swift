//
//  CharacterController.swift
//  CardGame
//
//  Created by RYAN GREENBURG on 12/14/20.
//

import UIKit

class CharacterController {
    
    static let jedi = [Character(name: "Anakin Skywalker", photo: UIImage(named: "anakin"), faction: "Jedi"),
                        Character(name: "Obi Wan Kenobi", photo: UIImage(named: "obi"), faction: "Jedi"),
                        Character(name: "Ahsoka Tano", photo: UIImage(named: "ahsoka"), faction: "Jedi"),
                        Character(name: "Princess Leia", photo: UIImage(named: "leia"), faction: "Jedi"),
                        Character(name: "Luke Skywalker", photo: UIImage(named: "luke"), faction: "Jedi"),
                        Character(name: "Mace Windu", photo: UIImage(named: "mace"), faction: "Jedi"),
                        Character(name: "Rey", photo: UIImage(named: "rey"), faction: "Jedi"),
                        Character(name: "Master Yoda", photo: UIImage(named: "yoda"), faction: "Jedi")]
    
    static let sith = [Character(name: "Darth Maul", photo: UIImage(named: "maul"), faction: "Sith"),
                       Character(name: "Moff Gideon", photo: UIImage(named: "moff"), faction: "Sith"),
                       Character(name: "Darth Vader", photo: UIImage(named: "vader"), faction: "Sith"),
                       Character(name: "Kylo Ren", photo: UIImage(named: "ren"), faction: "Sith"),
                       Character(name: "Darth Sidious", photo: UIImage(named: "sidious"), faction: "Sith")]
}

