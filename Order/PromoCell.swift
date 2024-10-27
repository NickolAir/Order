import UIKit

class PromoCell: UITableViewCell {
    
    var viewModel: TableViewModel.ViewModelType.Promo? {
        didSet {
            guard let viewModel = viewModel else { return }
            updateUI(with: viewModel)
        }
    }
    
    private lazy var backgroundContainer: UIView = {
        let background = UIView()
        background.translatesAutoresizingMaskIntoConstraints = false
        background.backgroundColor = UIColor.systemGray6
        background.layer.cornerRadius = 10
        return background
    }()
    
    private lazy var discountContainer: UIView = {
        let discount = UIView()
        discount.backgroundColor = UIColor.systemGreen
        discount.layer.cornerRadius = 10
        discount.translatesAutoresizingMaskIntoConstraints = false
        return discount
    }()
    
    private lazy var titleLabel: UILabel = {
        let title = UILabel()
        title.numberOfLines = 2
        title.font = UIFont.boldSystemFont(ofSize: 16)
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private lazy var discountLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var validityLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var switchControl: UISwitch = {
        let switchControl = UISwitch()
        switchControl.translatesAutoresizingMaskIntoConstraints = false
        switchControl.addTarget(self, action: #selector(switchValueChanged(_:)), for: .valueChanged)
        return switchControl
    }()
    
    private lazy var leftCircleView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        return view
    }()
    
    private lazy var rightCircleView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        return view
    }()
    
    var switchValueChangedCallback: ((Bool) -> Void)?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        selectionStyle = .none
        contentView.addSubview(backgroundContainer)
        backgroundContainer.addSubview(titleLabel)
        backgroundContainer.addSubview(discountContainer)
        discountContainer.addSubview(discountLabel)
        backgroundContainer.addSubview(validityLabel)
        backgroundContainer.addSubview(descriptionLabel)
        backgroundContainer.addSubview(switchControl)
        backgroundContainer.addSubview(leftCircleView)
        backgroundContainer.addSubview(rightCircleView)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            backgroundContainer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            backgroundContainer.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            backgroundContainer.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            backgroundContainer.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            
            titleLabel.leadingAnchor.constraint(equalTo: backgroundContainer.leadingAnchor, constant: 16),
            titleLabel.topAnchor.constraint(equalTo: backgroundContainer.topAnchor, constant: 8),
            
            discountContainer.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 8),
            discountContainer.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            discountContainer.heightAnchor.constraint(equalToConstant: 24),
            discountContainer.widthAnchor.constraint(greaterThanOrEqualToConstant: 40),
            
            discountLabel.centerXAnchor.constraint(equalTo: discountContainer.centerXAnchor),
            discountLabel.centerYAnchor.constraint(equalTo: discountContainer.centerYAnchor),
            
            switchControl.trailingAnchor.constraint(equalTo: backgroundContainer.trailingAnchor, constant: -16),
            switchControl.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            validityLabel.leadingAnchor.constraint(equalTo: backgroundContainer.leadingAnchor, constant: 16),
            validityLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            validityLabel.trailingAnchor.constraint(equalTo: backgroundContainer.trailingAnchor, constant: -16),
            
            descriptionLabel.leadingAnchor.constraint(equalTo: backgroundContainer.leadingAnchor, constant: 16),
            descriptionLabel.topAnchor.constraint(equalTo: validityLabel.bottomAnchor, constant: 4),
            descriptionLabel.trailingAnchor.constraint(equalTo: backgroundContainer.trailingAnchor, constant: -16),
            descriptionLabel.bottomAnchor.constraint(equalTo: backgroundContainer.bottomAnchor, constant: -8),
            
            leftCircleView.widthAnchor.constraint(equalToConstant: 20),
            leftCircleView.heightAnchor.constraint(equalToConstant: 20),
            leftCircleView.centerYAnchor.constraint(equalTo: backgroundContainer.centerYAnchor),
            leftCircleView.leadingAnchor.constraint(equalTo: backgroundContainer.leadingAnchor, constant: -10),
                        
            rightCircleView.widthAnchor.constraint(equalToConstant: 20),
            rightCircleView.heightAnchor.constraint(equalToConstant: 20),
            rightCircleView.centerYAnchor.constraint(equalTo: backgroundContainer.centerYAnchor),
            rightCircleView.trailingAnchor.constraint(equalTo: backgroundContainer.trailingAnchor, constant: 10)
        ])
    }
    
    private func updateUI(with viewModel: TableViewModel.ViewModelType.Promo) {
        titleLabel.text = viewModel.title
        discountLabel.text = "-\(viewModel.percent)%"
        validityLabel.text = viewModel.discount.isEmpty ? "Без срока действия" : viewModel.discount
        descriptionLabel.text = viewModel.info
        switchControl.isOn = viewModel.isActive
    }
    
    @objc private func switchValueChanged(_ sender: UISwitch) {
        switchValueChangedCallback?(sender.isOn)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
        discountLabel.text = nil
        validityLabel.text = nil
        descriptionLabel.text = nil
        switchControl.isOn = false
    }
}
