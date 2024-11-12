import UIKit

class ReviewListViewController: UIViewController {
    
    private let viewModel = ReviewListViewModel()
    private var productArray: [Product] = products
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(ProductCell.self, forCellReuseIdentifier: String(describing: ProductCell.self))
        return tableView
    }()
    
    private func showReviewController(product: Product) {
        var review = Review(product: product)
        DispatchQueue.main.asyncAfter(deadline: .now()) { [weak self] in
            self?.navigationItem.backButtonTitle = ""
            self?.navigationController?.pushViewController(ReviewViewController(review: review), animated: true)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Напишите отзыв"
        
        view.backgroundColor = .white
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
        tableView.reloadData()
        
        viewModel.dataUpdated = tableView.reloadData
        viewModel.createTable(products: productArray)
        
        viewModel.navigateToReviewScreen = { [weak self] viewController in
            self?.navigationController?.pushViewController(viewController, animated: true)
        }
    }
}

extension ReviewListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.cellViewModels.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        showReviewController(product: products[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewModel = self.viewModel.cellViewModels[indexPath.row]
        
        switch viewModel.type {
        case .promo(let promo):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PromoCell.self)) as? PromoCell else {
                return UITableViewCell()
            }
            
            cell.viewModel = promo
            return cell
        case .info(let info):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TitleCell.self)) as? TitleCell else {
                return UITableViewCell()
            }
            
            cell.viewModel = info
            return cell
        case .result(let result):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: OrderCell.self)) as? OrderCell else {
                return UITableViewCell()
            }
            
            cell.viewModel = result
            return cell

        case .button(let button):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ButtonCell.self)) as? ButtonCell else {
                return UITableViewCell()
            }
            
            cell.viewModel = button
            return cell
        case .promoField(let promoField):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PromoFieldCell.self)) as? PromoFieldCell else {
                return UITableViewCell()
            }
            
            cell.viewModel = promoField
            return cell
        case .productCell (let product):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ProductCell.self)) as? ProductCell else {
                return UITableViewCell()
            }
            
            cell.viewModel = product
            return cell
        case .ratingCell(let rating):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RatingCell.self)) as? RatingCell else {
                return UITableViewCell()
            }
            
            cell.viewModel = rating
            return cell
        case .commentCell(let comment):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CommentCell.self)) as? CommentCell else {
                return UITableViewCell()
            }
            
            cell.viewModel = comment
            return cell
        }
    }
}
