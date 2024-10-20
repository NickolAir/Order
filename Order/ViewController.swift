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
    
    let titleLabel: UILabel = {
            let label = UILabel()
            label.text = "Промокоды"
            label.font = UIFont.boldSystemFont(ofSize: 25)
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        private let subtitleLabel: UILabel = {
            let label = UILabel()
            label.text = "На один товар можно применить только один промокод"
            label.numberOfLines = 3
            label.font = UIFont.systemFont(ofSize: 14)
            label.textColor = .gray
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            setupViews()
            backgroundColor = .white
            selectionStyle = .none
        }
        
        required init?(coder: NSCoder) {
            super.init(coder: coder)
            setupViews()
            backgroundColor = .white
            selectionStyle = .none
        }
        
        private func setupViews() {
            contentView.addSubview(titleLabel)
            contentView.addSubview(subtitleLabel)
            
            NSLayoutConstraint.activate([
                titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
                titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
                
                subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
                subtitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
                subtitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
                subtitleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
            ])
        }}

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
            applyButton.backgroundColor = .orange.withAlphaComponent(0.2)
            applyButton.setTitleColor(.orange, for: .normal)
            applyButton.layer.cornerRadius = 10
            
            NSLayoutConstraint.activate([
                applyButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
                applyButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
                applyButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
                applyButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
                applyButton.heightAnchor.constraint(equalToConstant: 50)
            ])
        }
}

class PromoCell: UITableViewCell {
    
    let titleLabel = UILabel()
    let switchControl = UISwitch()
    
    var switchValueChanged: ((Bool) -> Void)?
    
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
        contentView.addSubview(switchControl)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        switchControl.translatesAutoresizingMaskIntoConstraints = false
        
        switchControl.addTarget(self, action: #selector(switchValueChanged(_:)), for: .valueChanged)
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            switchControl.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            switchControl.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    @objc private func switchValueChanged(_ sender: UISwitch) {
        switchValueChanged?(sender.isOn)
    }
    
    func configure(with promocode: Order.Promocode) {
        titleLabel.text = promocode.title
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
        hideButton.contentHorizontalAlignment = .left

        hideButton.setContentHuggingPriority(.required, for: .horizontal)
        hideButton.setContentCompressionResistancePriority(.required, for: .horizontal)
        
        NSLayoutConstraint.activate([
            hideButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            hideButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            hideButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }
}

class OrderCell: UITableViewCell {
    
    let priceLabel = UILabel()
    let discountLabel = UILabel()
    let promoCodeLabel = UILabel()
    let paymentMethodLabel = UILabel()
    let totalLabel = UILabel()
    let applyButton = UIButton(type: .system)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        backgroundColor = UIColor.systemGray6
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        selectionStyle = .none
        backgroundColor = UIColor.systemGray6
        setupUI()
    }
    
    private func setupUI() {
        [priceLabel, discountLabel, promoCodeLabel, paymentMethodLabel, totalLabel, applyButton].forEach {
            contentView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        priceLabel.font = UIFont.systemFont(ofSize: 16)
        priceLabel.textAlignment = .left
        discountLabel.textAlignment = .left
        discountLabel.font = UIFont.systemFont(ofSize: 16)
        promoCodeLabel.textAlignment = .left
        promoCodeLabel.font = UIFont.systemFont(ofSize: 16)
        paymentMethodLabel.textAlignment = .left
        paymentMethodLabel.font = UIFont.systemFont(ofSize: 16)
        totalLabel.font = UIFont.boldSystemFont(ofSize: 18)
        totalLabel.textAlignment = .left

        applyButton.setTitle("Оформить заказ", for: .normal)
        applyButton.backgroundColor = .orange
        applyButton.setTitleColor(.white, for: .normal)
        applyButton.layer.cornerRadius = 10

        NSLayoutConstraint.activate([
            priceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            priceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            priceLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            
            discountLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            discountLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            discountLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 4),
            
            promoCodeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            promoCodeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            promoCodeLabel.topAnchor.constraint(equalTo: discountLabel.bottomAnchor, constant: 4),
            
            paymentMethodLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            paymentMethodLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            paymentMethodLabel.topAnchor.constraint(equalTo: promoCodeLabel.bottomAnchor, constant: 4),
            
            totalLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            totalLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            totalLabel.topAnchor.constraint(equalTo: paymentMethodLabel.bottomAnchor, constant: 10),
            
            applyButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            applyButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            applyButton.topAnchor.constraint(equalTo: totalLabel.bottomAnchor, constant: 16),
            applyButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            applyButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func configure(with price: String, quantity: Int, discount: String, promoCode: String, paymentMethod: String, total: String) {
        priceLabel.text = "Цена за \(quantity) товара: \(price)"
        discountLabel.text = "Скидки: \(discount)"
        promoCodeLabel.text = "Промокоды: \(promoCode)"
        paymentMethodLabel.text = "Способ оплаты: \(paymentMethod)"
        totalLabel.text = "Итого: \(total)"
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
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 4),
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -4)
        ])
    }
}

class ViewModel {
    
}

class ViewController: UIViewController {
    
    private var order: Order?
    private let tableView = UITableView(frame: .zero, style: .plain)
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
               titleView.heightAnchor.constraint(equalToConstant: 30)
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
        //tableView.backgroundColor = .white
        
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
            if order != nil {
                cell.configure(with: "1000", quantity: 2, discount: "10", promoCode: "100", paymentMethod: "900", total: "900")
            }
            return cell
            
        default:
            return UITableViewCell()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
            return 5
        }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            switch section {
            case 1, 2, 3, 4:
                return 1
            default:
                return 0
            }
        }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            let headerView = UIView()
            return headerView
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
