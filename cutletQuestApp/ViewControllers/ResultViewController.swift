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
    
    private var burgerForCart: Product?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        updateResult()
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    @IBAction func addToCartButtonTapped() {
        guard let burgerForCart else {return}
        CurrentUser.shared.user?.cart.addToBCart(product: burgerForCart)
        dismiss(animated: true)
    }

    private func updateResult() {
        var frequencyBurgers: [Burger: Int] = [:]
        let burgers = answers.map { $0.product }
        
        for burger in burgers {
            frequencyBurgers[burger, default: 0] += 1
        }
        
        let sortedFrequentBurgers = frequencyBurgers.sorted { $0.value > $1.value }
        guard let mostFrequentBurger = sortedFrequentBurgers.first?.key else { return }
        
        burgerForCart = mostFrequentBurger.menuBurger
        updateUI(with: mostFrequentBurger)
    }
    
    private func updateUI(with burger: Burger) {
        burgerTypeLabel.text = "Наша рекомендация – \(burger.menuBurger?.name ?? "")!"
        descriptionLabel.text = burger.menuBurger?.description ?? ""
    }
    
}
