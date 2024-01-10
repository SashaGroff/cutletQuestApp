//
//  QuizTableViewCell.swift
//  cutletQuestApp
//
//  Created by Aleksandr Goncharov on 10.01.2024.
//

import UIKit

class QuizTableViewCell: UITableViewCell {

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func quizButtonPressed() {
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
