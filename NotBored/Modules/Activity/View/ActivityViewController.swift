import UIKit

class ActivityViewController: UIViewController {
    
    @IBOutlet weak var activityDescriptionLabel: UILabel!
    @IBOutlet weak var tryAnotherButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    init(title: String = "Activity") {
        super.init(nibName: nil, bundle: nil)
        self.title = title.capitalized
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension ActivityViewController {
    func setup() {
        activityDescriptionLabel.text = "Learn to greet someone in a new language"
        tryAnotherButton.layer.cornerRadius = 8
    }
}
