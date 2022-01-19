//
//  FilterViewController.swift
//  StarWarsCardGame
//
//  Created by Mitya Kim on 1/19/22.
//

import UIKit

protocol FilterSelectionDelegate: AnyObject {
    func selected(faction: String)
}

class FilterViewController: UIViewController {

    weak var delegate: FilterSelectionDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func sithButton(_ sender: Any) {
        delegate?.selected(faction: "sith")
        self.dismiss(animated: true)
    }
    
    @IBAction func jediButton(_ sender: Any) {
        delegate?.selected(faction: "jedi")
        self.dismiss(animated: true)
    }
}
