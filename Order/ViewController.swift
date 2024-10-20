import UIKit

struct Order {

    struct Promocode {

        let title: String

        let percent: Int

        let endDate: Date?

        let info: String?

        let active: Bool

    }

    struct Product {

        let price: Double

        let title: String

    }

    var screenTitle: String

    var promocodes: [Promocode]

    
    
    let products: [Product]

    let paymentDiscount: Double?

    let baseDiscount: Double?

}

class TitleCell: UITableViewCell {
    
    let titleLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        selectionStyle = .none
        setupUI()
    }
    
    private func setupUI() {
        contentView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }
    
    func configure(with title: String) {
        titleLabel.text = title
    }
}

class ApplyPromocodeCell: UITableViewCell {
    let applyButton = UIButton(type: .system)
        
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            selectionStyle = .none
            setupUI()
        }
        
        required init?(coder: NSCoder) {
            super.init(coder: coder)
            selectionStyle = .none
            setupUI()
        }
        
        private func setupUI() {
            contentView.addSubview(applyButton)
            applyButton.translatesAutoresizingMaskIntoConstraints = false
            
            applyButton.setTitle("Применить промокод", for: .normal)
            applyButton.backgroundColor = .systemOrange
            applyButton.setTitleColor(.white, for: .normal)
            applyButton.layer.cornerRadius = 10
            
            NSLayoutConstraint.activate([
                applyButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
                applyButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
                applyButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
                applyButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
                applyButton.heightAnchor.constraint(equalToConstant: 44)
            ])
        }
}

class PromoCell: UITableViewCell {
    
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let leftCircleView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let rightCircleView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let discountLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.textColor = .white
        label.backgroundColor = .systemGreen
        label.layer.cornerRadius = 5
        label.clipsToBounds = true
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let infoLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let switchControl: UISwitch = {
        let switchControl = UISwitch()
        switchControl.translatesAutoresizingMaskIntoConstraints = false
        return switchControl
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        selectionStyle = .none
        setupViews()
    }
    
    private func setupViews() {
        contentView.addSubview(containerView)
        contentView.addSubview(leftCircleView)
        contentView.addSubview(rightCircleView)
        
        containerView.addSubview(titleLabel)
        containerView.addSubview(discountLabel)
        containerView.addSubview(infoLabel)
        containerView.addSubview(switchControl)
        
        NSLayoutConstraint.activate([
            // Constraints for containerView
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            // Constraints for leftCircleView
            leftCircleView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            leftCircleView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: -10),
            leftCircleView.widthAnchor.constraint(equalToConstant: 20),
            leftCircleView.heightAnchor.constraint(equalToConstant: 20),
            
            // Constraints for rightCircleView
            rightCircleView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            rightCircleView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 10),
            rightCircleView.widthAnchor.constraint(equalToConstant: 20),
            rightCircleView.heightAnchor.constraint(equalToConstant: 20),
            
            // Constraints for titleLabel
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            
            // Constraints for discountLabel
            discountLabel.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            discountLabel.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 8),
            discountLabel.widthAnchor.constraint(equalToConstant: 40),
            discountLabel.heightAnchor.constraint(equalToConstant: 20),
            
            // Constraints for infoLabel
            infoLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            infoLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            infoLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            
            // Constraints for switchControl
            switchControl.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            switchControl.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16)
        ])
    }
    
    func configure(with promocode: Order.Promocode) {
        titleLabel.text = promocode.title
        discountLabel.text = "-\(promocode.percent)%"
        infoLabel.text = promocode.info
        switchControl.isOn = promocode.active
    }
}

class HidePromoCell: UITableViewCell {
    
    let hideButton = UIButton(type: .system)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        selectionStyle = .none
        setupUI()
    }
    
    private func setupUI() {
        contentView.addSubview(hideButton)
        hideButton.translatesAutoresizingMaskIntoConstraints = false
        
        hideButton.setTitle("Скрыть промокоды", for: .normal)
        hideButton.backgroundColor = .clear
        hideButton.setTitleColor(.systemRed, for: .normal)
        
        NSLayoutConstraint.activate([
            hideButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            hideButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            hideButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            hideButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            hideButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
}

class OrderCell: UITableViewCell {
    
    let totalLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        selectionStyle = .none
        setupUI()
    }
    
    private func setupUI() {
        contentView.addSubview(totalLabel)
        totalLabel.translatesAutoresizingMaskIntoConstraints = false
        totalLabel.textAlignment = .center
        totalLabel.font = UIFont.boldSystemFont(ofSize: 18)
        
        NSLayoutConstraint.activate([
            totalLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            totalLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            totalLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            totalLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }
    
    func configure(with total: String) {
        totalLabel.text = total
    }
}

class OrderTitleView: UIView {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Оформление заказа"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8)
        ])
    }
}
class ViewModel {
    
}

class ViewController: UIViewController {
    
    private var order: Order?
    private let tableView = UITableView(frame: .zero, style: .grouped)
    private let titleView = OrderTitleView()

    override func viewDidLoad() {
        super.viewDidLoad()
    
        setupTitleView()
        setupTableView()
        setupOrderData()
    }
    
    private func setupTitleView() {
           view.addSubview(titleView)
           titleView.translatesAutoresizingMaskIntoConstraints = false
           
           NSLayoutConstraint.activate([
               titleView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
               titleView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
               titleView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
               titleView.heightAnchor.constraint(equalToConstant: 44)
           ])
       }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(TitleCell.self, forCellReuseIdentifier: "TitleCell")
        tableView.register(ApplyPromocodeCell.self, forCellReuseIdentifier: "ApplyPromocodeCell")
        tableView.register(PromoCell.self, forCellReuseIdentifier: "PromoCell")
        tableView.register(HidePromoCell.self, forCellReuseIdentifier: "HidePromoCell")
        tableView.register(OrderCell.self, forCellReuseIdentifier: "OrderCell")
        tableView.separatorStyle = .none
        
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
                tableView.topAnchor.constraint(equalTo: titleView.bottomAnchor, constant: 16),
                tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            ])
    }
        
    private func setupOrderData() {
        let promocode1 = Order.Promocode(title: "Промокод1", percent: 10, endDate: nil, info: nil, active: false)
        let promocode2 = Order.Promocode(title: "Промокод2", percent: 20, endDate: nil, info: nil, active: false)
        let promocode3 = Order.Promocode(title: "Промокод3", percent: 30, endDate: nil, info: nil, active: false)
        
        let product1 = Order.Product(price: 1000, title: "Товар1")
        let product2 = Order.Product(price: 2000, title: "Товар2")
        
        order = Order(screenTitle: "Заказ", promocodes: [promocode1, promocode2, promocode3], products: [product1, product2], paymentDiscount: nil, baseDiscount: nil)
        
        tableView.reloadData()
    }
    }

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "TitleCell", for: indexPath) as! TitleCell
            cell.configure(with: "Промокоды")
            return cell
            
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ApplyPromocodeCell", for: indexPath) as! ApplyPromocodeCell
            
            return cell
            
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "PromoCell", for: indexPath) as! PromoCell
            if let promocode = order?.promocodes[indexPath.row] {
                cell.configure(with: promocode)
            }
            return cell
            
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "HidePromoCell", for: indexPath) as! HidePromoCell
           
            return cell
            
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: "OrderCell", for: indexPath) as! OrderCell
            if let order = order {
                cell.configure(with: "Итого: 0 ₽")
            }
            return cell
            
        default:
            return UITableViewCell()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
            return 5
        }
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return 1
        case 1: return 1
        case 2: return order?.promocodes.count ?? 0
        case 3: return 1
        case 4: return 1
        default: return 0
        }
    }
}
