import UIKit

class ActivityViewController: UIViewController {
    
    @IBOutlet weak var containerStackView: UIStackView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var activityDescriptionLabel: UILabel!
    @IBOutlet weak var participantsLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var categoryStackView: UIStackView!
    
    @IBOutlet weak var tryAnotherButton: UIButton! {
        didSet { tryAnotherButton.layer.cornerRadius = 8 }
    }
    
    let activityViewModel = ActivityViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getActivity()
    }
    
    init(title: String = "Activity") {
        super.init(nibName: nil, bundle: nil)
        self.title = title.capitalized
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


// MARK: - Methods
extension ActivityViewController {
    func getActivity() {
        startLoadingActivity(true)
        activityViewModel.getActivity { result in
            switch result {
            case .success(let activity):
                self.setActivityView(activity)
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
    
    func setActivityView(_ activity: ActivityModel) {
        activityDescriptionLabel.text = activity.activity
        participantsLabel.text = String(activity.participants)
        priceLabel.text = String(activity.price)
        categoryLabel.text = activity.type
        
        categoryStackView.isHidden = title?.lowercased() != "random"
        
        startLoadingActivity(false)
    }
    
    func startLoadingActivity(_ loading: Bool) {
        if loading {
            tryAnotherButton.configuration?.showsActivityIndicator = true
            activityIndicator.startAnimating()
            containerStackView.isHidden = true
        } else {
            activityIndicator.stopAnimating()
            containerStackView.isHidden = false
            tryAnotherButton.configuration?.showsActivityIndicator = false
        }
    }
}

// MARK: - Actions
extension ActivityViewController {
    @IBAction func tryAnotherTapped(_ sender: UIButton) {
        getActivity()
    }
}
