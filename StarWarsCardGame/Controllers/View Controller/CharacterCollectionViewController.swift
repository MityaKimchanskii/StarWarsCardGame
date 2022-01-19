//
//  CharacterCollectionViewController.swift
//  StarWarsCardGame
//
//  Created by Mitya Kim on 1/18/22.
//

import UIKit

private let reuseIdentifier = "Cell"

class CharacterCollectionViewController: UICollectionViewController {
    
    private var displayedCharacters: [Character] = []
    private var targetCharacter: Character?
    private var selectedFaction = "jedi"

    override func viewDidLoad() {
        super.viewDidLoad()
        shuffleChar(for: selectedFaction)
        
    }

    func shuffleChar(for faction: String) {
        if faction == "jedi" {
            let jediGroup = CharacterController.jedi.prefix(3)
            displayedCharacters = Array(jediGroup)
            targetCharacter = CharacterController.sith.randomElement()
        } else if faction == "sith" {
            let sithGroup = CharacterController.sith.prefix(3)
            displayedCharacters = Array(sithGroup)
            targetCharacter = CharacterController.jedi.randomElement()
        }
        
        updateViews()
    }
    
    private func updateViews() {
        guard let targetCharacter = targetCharacter else { return }
        displayedCharacters.append(targetCharacter)
        displayedCharacters.shuffle()
        collectionView.reloadData()
        title = "Find \(targetCharacter.name)"
        collectionView.reloadData()
    }
    
    func presentAlert(for character: Character) {
        let success = character == targetCharacter
        let alertController = UIAlertController(title: success ? "Good job" : "Ku-ku", message: nil, preferredStyle: .alert)
        let doneAction = UIAlertAction(title: "Done", style: .cancel)
        let suffleAction = UIAlertAction(title: "Shiffle", style: .default) { _ in
            self.shuffleChar(for: self.selectedFaction)
        }
        
        alertController.addAction(doneAction)
        
        if success {
            alertController.addAction(suffleAction)
        }
        present(alertController, animated: true)
    }


    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "filterSegue" {
            let vc = segue.destination as? FilterViewController
            vc?.delegate = self
        }
    }
    
    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return displayedCharacters.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "charCell", for: indexPath) as? CharacterCollectionViewCell else { return UICollectionViewCell() }
        
        let character = displayedCharacters[indexPath.row]
        cell.displayImage(for: character)
    
        return cell
    }

    // MARK: UICollectionViewDelegate
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let character = displayedCharacters[indexPath.row]
        presentAlert(for: character)
    }

}

extension CharacterCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.width / 2
        return CGSize(width: width - 15, height: width + 30)
    }
}

extension CharacterCollectionViewController: FilterSelectionDelegate {
    func selected(faction: String) {
        selectedFaction = faction
        shuffleChar(for: selectedFaction)
    }
}
