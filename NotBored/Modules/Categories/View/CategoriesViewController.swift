import UIKit

class CategoriesViewController: UIViewController {

    @IBOutlet weak var categoriesTableView: UITableView!
    
    let categories: [String] = ["education", "recreational", "social", "diy", "charity", "cooking", "relaxation", "music", "busywork"]
    let categoryCellIdentifier = "CategoryViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

}

extension CategoriesViewController {
    private func setup() {
        title = "Categories"
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(randomTapped))
        
        categoriesTableView.delegate = self
        categoriesTableView.dataSource = self
        categoriesTableView.register(UINib(nibName: categoryCellIdentifier, bundle: nil), forCellReuseIdentifier: categoryCellIdentifier)
    }
    
    @objc func randomTapped() {
        navigationController?.pushViewController(ActivityViewController(title: "random"), animated: true)
    }
}

extension CategoriesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: categoryCellIdentifier) as? CategoryViewCell
        else {
            return UITableViewCell()
        }
        cell.setup(categoryName: categories[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.pushViewController(ActivityViewController(title: categories[indexPath.row]), animated: true)
    }
    
}
