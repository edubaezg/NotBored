import UIKit

class TermAndConditionsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

// MARK: - Actions
extension TermAndConditionsViewController {
    @IBAction func goBackHome(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
