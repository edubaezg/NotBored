import UIKit

class TermAndConditionsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
}

// MARK: - Methods
extension TermAndConditionsViewController {
    func setup() {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
}

// MARK: - Actions
extension TermAndConditionsViewController {
    @IBAction func goBackHome(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
