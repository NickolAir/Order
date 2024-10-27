import UIKit

struct TableViewModel {
    enum ViewModelType {
        struct Promo {
            let id: String = UUID().uuidString
            let title: String
            let discount: String
            let percent: String
            let info: String
            let isActive: Bool
            let toggle: ((Bool, String) -> Void)?
            
            init(title: String,
                 discount: String,
                 percent: String,
                 info: String,
                 isActive: Bool,
                 toggle: (((Bool, String) -> Void))? = nil) {
                self.title = title
                self.discount = discount
                self.percent = percent
                self.info = info
                self.isActive = isActive
                self.toggle = toggle
            }
        }
        
        struct TitleInfo {
            let title: String
            let info: String
        }
        
        struct Result {
            var summ: Double
            let productsCount: Int
            let baseDiscount: Double?
            var promocodesDiscount: Double
            let paymentDiscount: Double?
            let price: Double
        }
        
        struct Button {
            let image: UIImage?
            let title: String?
            let titleColor: UIColor?
            let buttonColor: UIColor?
            let buttonType: type
            let action: (() -> Void)? // Action closure
            
            enum type {
                case Hide
                case Apply
            }
        }
        
        case info(TitleInfo)
        case promo(Promo)
        case result(Result)
        case button(Button)
    }

    var type: ViewModelType
}

class ViewController: UIViewController {
    
    let viewModel = ViewModel()
    
    private let titleView = OrderTitleView()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(OrderCell.self, forCellReuseIdentifier: String(describing: OrderCell.self))
        tableView.register(PromoCell.self, forCellReuseIdentifier: String(describing: PromoCell.self))
        tableView.register(TitleCell.self, forCellReuseIdentifier: String(describing: TitleCell.self))
        tableView.register(ButtonCell.self, forCellReuseIdentifier: String(describing: ButtonCell.self))
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTitleView()
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: titleView.bottomAnchor, constant: 10).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
        
        tableView.reloadData()
        
        viewModel.navigateToPromoScreen = { [weak self] viewController in
            self?.navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    private func setupTitleView() {
       view.addSubview(titleView)
       titleView.translatesAutoresizingMaskIntoConstraints = false
       
       NSLayoutConstraint.activate([
           titleView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
           titleView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
           titleView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
           titleView.heightAnchor.constraint(equalToConstant: 30)
       ])
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.cellViewModels.count
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
        }
    }
}
