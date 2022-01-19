//
//  CharacterCollectionViewCell.swift
//  StarWarsCardGame
//
//  Created by Mitya Kim on 1/18/22.
//

import UIKit

class CharacterCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var characterImageView: UIImageView!
    func displayImage(for character: Character) {
        characterImageView.image = character.photo
        characterImageView.contentMode = .scaleAspectFill
        characterImageView.clipsToBounds = true
    }
}
