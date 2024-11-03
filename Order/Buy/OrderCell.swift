import UIKit

class OrderCell: UITableViewCell {
    var viewModel: TableViewModel.ViewModelType.Result? {
        didSet {
            updateUI()
        }
    }
    
    private var bgColor: UIColor?

    private lazy var summaryVerticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        return stackView
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Оформление заказа", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.black, for: .highlighted)
        button.backgroundColor = UIColor.init(red: 1, green: 70/255, blue: 17/255, alpha: 1)
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(makeOrderTapAnimation), for: .touchUpInside)
        return button
    }()
    
    private lazy var separatorLine: UIView = {
        let separatorLine = UIView()
        separatorLine.backgroundColor = .gray
        return separatorLine
    }()
    
    private lazy var priceView = createValueView(headerText: "Цена за 2 товара", valueText: "25 000 ₽")
    private lazy var discountView = createValueView(headerText: "Скидки", valueText: "-5 000 ₽", valueColor: UIColor.init(red: 1, green: 70/255, blue: 17/255, alpha: 1))
    private lazy var promocodesDiscountView = createValueView(headerText: "Промокоды", valueText: "-5 000 ₽", valueColor: UIColor.init(red: 0, green: 183/255, blue: 117/255, alpha: 1))
    private lazy var paymentDiscountView = createValueView(headerText: "Способ оплаты", valueText: "-5 000 ₽")
    private lazy var summView = createValueView(headerText: "Итого", valueText: "19 000 ₽", valueFont: UIFont(name: "Roboto", size: 18))

    private lazy var offerLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 2
        let fullText = "Нажимая кнопку «Оформить заказ»,\nВы соглашаетесь с Условиями оферты"
        let attributedText = NSMutableAttributedString(string: fullText)

        attributedText.addAttribute(.foregroundColor, value: UIColor.gray, range: NSRange(location: 0, length: fullText.count))
        attributedText.addAttribute(.font, value: UIFont(name: "Roboto", size: 12) ?? .systemFont(ofSize: 12), range: NSRange(location: 0, length: fullText.count))

        let linkTextRange = (fullText as NSString).range(of: "Условиями оферты")
        attributedText.addAttribute(.foregroundColor, value: UIColor.black, range: linkTextRange)
        attributedText.addAttribute(.font, value: UIFont(name: "Roboto", size: 12) ?? .systemFont(ofSize: 12), range: linkTextRange)

        label.attributedText = attributedText
        return label
    }()
    
    @objc private func makeOrderTapAnimation() {
        UIView.animate(withDuration: 0.2) {
            self.button.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        } completion: { _ in
            UIView.animate(withDuration: 0.2) {
                self.button.transform = CGAffineTransform.identity
            }
        }
    }

    private func updateUI() {
        guard let viewModel = viewModel else { return }
        
        priceView.valueLabel.text = "\(viewModel.price) ₽"
        promocodesDiscountView.valueLabel.text = "\(viewModel.promocodesDiscount) ₽"
        discountView.valueLabel.text = "\(viewModel.baseDiscount ?? 0) ₽"
        paymentDiscountView.valueLabel.text = "\(viewModel.paymentDiscount ?? 0) ₽"
        summView.valueLabel.text = "\(viewModel.summ) ₽"
        priceView.headerLabel.text = "Цена за \(viewModel.productsCount) продукта"
    }
    
    private func createValueView(headerText: String, valueText: String, valueColor: UIColor = .black, valueFont: UIFont? = UIFont(name: "Roboto", size: 14)) -> ValueView {
        let valueView = ValueView()
        valueView.headerLabel.text = headerText
        valueView.valueLabel.text = valueText
        valueView.valueLabel.textColor = valueColor
        valueView.valueLabel.font = valueFont
        return valueView
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        contentView.backgroundColor = .gray.withAlphaComponent(0.1)
        
        contentView.addSubview(summaryVerticalStackView)
        summaryVerticalStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            summaryVerticalStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 24),
            summaryVerticalStackView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 32),
            summaryVerticalStackView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -32)
        ])
        
        summaryVerticalStackView.addArrangedSubview(priceView)
        summaryVerticalStackView.addArrangedSubview(discountView)
        summaryVerticalStackView.addArrangedSubview(promocodesDiscountView)
        summaryVerticalStackView.addArrangedSubview(paymentDiscountView)

        contentView.addSubview(separatorLine)
        separatorLine.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            separatorLine.topAnchor.constraint(equalTo: summaryVerticalStackView.bottomAnchor, constant: 16),
            separatorLine.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 32),
            separatorLine.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -32),
            separatorLine.heightAnchor.constraint(equalToConstant: 1)
        ])
        
        contentView.addSubview(summView)
        summView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            summView.topAnchor.constraint(equalTo: separatorLine.bottomAnchor, constant: 16),
            summView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 32),
            summView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -32)
        ])
        
        contentView.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: summView.bottomAnchor, constant: 16),
            button.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 32),
            button.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -32),
            button.heightAnchor.constraint(equalToConstant: 54)
        ])
        
        contentView.addSubview(offerLabel)
        offerLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            offerLabel.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 16),
            offerLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 32),
            offerLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -32),
            offerLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -40)
        ])
    }
}

class ValueView: UIView {
    let headerLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: "Roboto", size: 14)
        return label
    }()
    
    let valueLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: "Roboto", size: 14)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        let stackView = UIStackView(arrangedSubviews: [headerLabel, valueLabel])
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
