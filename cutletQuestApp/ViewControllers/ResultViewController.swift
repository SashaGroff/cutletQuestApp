//
//  ResultViewController.swift
//  cutletQuestApp
//
//  Created by Alexander on 18.01.2024.
//

import UIKit

final class ResultViewController: UIViewController {

    
    @IBOutlet var burgerTypeLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    var answers: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
    }
    
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
}

extension ResultViewController {
    private func updateResult() {
        var frequencyBurgers: [Burger: Int] = [:]
        let burgers = answers.map { $0.burger }
        
        
        for burger in burgers {
            frequencyBurgers[burger, default: 0] += 1
        }
        
        
        let sortedFrequentBurgers = frequencyBurgers.sorted { $0.value > $1.value }
        guard let mostFrequentBurger = sortedFrequentBurgers.first?.key else { return }
        
        updateUI(with: mostFrequentBurger)
    }
    
    private func updateUI(with burger: Burger) {
        burgerTypeLabel.text = "Hi - \(burger.rawValue)!"
        descriptionLabel.text = burger.definition
    }
    
}
