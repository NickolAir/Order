import UIKit

class AddPromoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    private let viewModel = AddPromoViewModel()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.backgroundColor = .none
        tableView.register(PromoFieldCell.self, forCellReuseIdentifier: String(describing: PromoFieldCell.self))
        tableView.register(ButtonCell.self, forCellReuseIdentifier: String(describing: ButtonCell.self))
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.cellModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewModel = self.viewModel.cellModels[indexPath.row]
        
        
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Применить промокод"
        self.navigationController?.navigationBar.tintColor = UIColor.init(red: 1, green: 70/255, blue: 17/255, alpha: 1)
        self.navigationController?.navigationBar.backItem?.title = ""

        view.backgroundColor = .white
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
        
        tableView.reloadData()
    }
}
