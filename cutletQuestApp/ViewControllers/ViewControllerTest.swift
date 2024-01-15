//
//  ViewControllerTest.swift
//  cutletQuestApp
//
//  Created by Егор Аблогин on 15.01.2024.
//

import UIKit

class ViewControllerTest: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

}


extension ViewControllerTest: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(
            withIdentifier: "cell",
            for: indexPath
        )
        
        cell.textLabel?.text = "1"
        
        return cell
    }

}
