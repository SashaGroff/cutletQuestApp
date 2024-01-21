//
//  AppInfoFullViewController.swift
//  cutletQuestApp
//
//  Created by Natalia Ovdina on 19.01.2024.
//

import UIKit

final class AppInfoFullViewController: UIViewController {

    private let infoAboutApp = DataStore.shared.aboutApp
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var infoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        infoLabel.text = infoAboutApp.info
    }
    
    @IBAction func tappedButton() {
        dismiss(animated: true)
    }

    

}
