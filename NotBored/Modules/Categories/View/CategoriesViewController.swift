import UIKit

class CategoriesViewController: UIViewController {

    @IBOutlet weak var categoriesTableView: UITableView!
    
    var participants: String
    let categoryCellIdentifier = "CategoryViewCell"
    let categories: [String] = ["education", "recreational", "social", "diy", "charity", "cooking", "relaxation", "music", "busywork"].sorted()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    init(participants: String) {
        self.participants = participants
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

// MARK: - Methods
extension CategoriesViewController {
    private func setup() {
        title = "Categories"
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Random", style: .plain, target: self, action: #selector(randomTapped))
        
        categoriesTableView.delegate = self
        categoriesTableView.dataSource = self
        categoriesTableView.register(UINib(nibName: categoryCellIdentifier, bundle: nil), forCellReuseIdentifier: categoryCellIdentifier)
    }
    
    @objc func randomTapped() {
        navigationController?.pushViewController(ActivityViewController(title: "random", participants: participants), animated: true)
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension CategoriesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: categoryCellIdentifier) as? CategoryViewCell
        else { return UITableViewCell() }
        cell.setup(categoryName: categories[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let title = categories[indexPath.row]
        navigationController?.pushViewController(ActivityViewController(title: title, participants: participants), animated: true)
    }
    
}
