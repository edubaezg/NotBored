//
//  TermAndConditionsViewController.swift
//  NotBored
//
//  Created by Eduardo Alfonso Gutierrez Gomez on 19/03/22.
//

import UIKit

class TermAndConditionsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    // MARK: - Actions
    @IBAction func goBackHome(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
