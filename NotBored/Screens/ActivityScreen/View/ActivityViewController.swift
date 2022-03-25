import UIKit

class ActivityViewController: UIViewController {
    
    @IBOutlet weak var containerStackView: UIStackView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var activityDescriptionLabel: UILabel!
    @IBOutlet weak var activityDetailStackView: UIStackView!
    @IBOutlet weak var participantsLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var categoryStackView: UIStackView!
    
    @IBOutlet weak var tryAnotherButton: UIButton! {
        didSet { tryAnotherButton.layer.cornerRadius = 8 }
    }
    
    let activityViewModel = ActivityViewModel()
    var participants: String
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startLoadingActivity(true)
        getActivity()
    }
    
    init(title: String, participants: String) {
        self.participants = participants
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
        tryAnotherButton.configuration?.showsActivityIndicator = true
        activityViewModel.getActivity(getActivityOptions()) { result in
            switch result {
            case .success(let activity):
                self.setActivityView(activity)
            case .failure:
                self.setErrorView()
            }
        }
    }
    
    func getActivityOptions() -> ActivityOptionsModel {
        ActivityOptionsModel(category: title!.lowercased(), participants: participants)
    }
    
    func startLoadingActivity(_ loading: Bool) {
        if loading {
            activityIndicator.startAnimating()
            containerStackView.isHidden = true
        } else {
            activityIndicator.stopAnimating()
            containerStackView.isHidden = false
            tryAnotherButton.configuration?.showsActivityIndicator = false
        }
    }
    
    func setActivityView(_ activity: ActivityModel) {
        activityDetailStackView.isHidden = false
        categoryStackView.isHidden = title?.lowercased() != "random"
        
        activityDescriptionLabel.text = activity.activity
        participantsLabel.text = String(activity.participants)
        priceLabel.text = getPriceDescription(activity.price)
        categoryLabel.text = activity.type.capitalized
        
        startLoadingActivity(false)
        tryAnotherButton.configuration?.showsActivityIndicator = false
    }
    
    func setErrorView() {
        activityDetailStackView.isHidden = true
        activityDescriptionLabel.text = "Sorry, we couldn't get an activity for you"
        startLoadingActivity(false)
    }
    
    func getPriceDescription(_ price: Double) -> String {
        var priceDescription: String
        
        switch price {
        case 0: priceDescription = "Free"
        case 0.01...0.3: priceDescription = "Low"
        case 0.4...0.6: priceDescription = "Medium"
        default: priceDescription = "High"
        }
        
        return priceDescription
    }
    
}

// MARK: - Actions
extension ActivityViewController {
    @IBAction func tryAnotherTapped(_ sender: UIButton) {
        getActivity()
    }
}
