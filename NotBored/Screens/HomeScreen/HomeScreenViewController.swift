import UIKit

class HomeScreenViewController: UIViewController {

    @IBOutlet weak private var participantsAmountTextField: UITextField!
    
    @IBOutlet weak var startButton: UIButton! {
        didSet { startButton.layer.cornerRadius = 8 }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        participantsAmountTextField.resignFirstResponder()
    }
}

// MARK: - Actions
extension HomeScreenViewController {
    @IBAction private func startButton(_ sender: Any) {
        guard let participants = participantsAmountTextField.text else { return }
        let activitiesVC = CategoriesViewController(participants: participants)
        navigationController?.pushViewController(activitiesVC, animated: true)
    }
    
    @IBAction func goToTermAndConditions(_ sender: Any) {
        let termAndConditions = TermAndConditionsViewController()
        navigationController?.pushViewController(termAndConditions, animated: true)
    }
}
