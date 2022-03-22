//
//  HomeScreen2ViewController.swift
//  NotBored
//
//  Created by Eduardo Alfonso Gutierrez Gomez on 19/03/22.
//

import UIKit

class HomeScreenViewController: UIViewController {
    // MARK: - Outlets
    
    @IBOutlet weak private var participantsAmountTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //participantsAmountTextField.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //navigationController?.navigationBar.backgroundColor = .red
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    // MARK: - IBActions
    @IBAction private func startButton(_ sender: Any) {
<<<<<<< HEAD
        let activitiesVC = CategoriesView()
=======
        let activitiesVC = CategoriesViewController()
>>>>>>> 1702ff17fab1ab148e2c94343271b4f2f7b8fc6b
        navigationController?.pushViewController(activitiesVC, animated: true)
    }
    
    @IBAction func goToTermAndConditions(_ sender: Any) {
        let termAndConditions = TermAndConditionsViewController()
        navigationController?.pushViewController(termAndConditions, animated: true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        participantsAmountTextField.resignFirstResponder()
    }
}

/*extension HomeScreenViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    return true
    }
}*/
