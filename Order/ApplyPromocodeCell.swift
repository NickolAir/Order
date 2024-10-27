import UIKit

class ApplyPromocodeCell: UITableViewCell {
    
    var viewModel: TableViewModel.ViewModelType.Button? {
        didSet {
            guard let viewModel = viewModel else { return }
            updateUI(with: viewModel)
        }
    }
    
    private lazy var applyButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Применить промокод", for: .normal)
        button.backgroundColor = .orange.withAlphaComponent(0.15)
        button.setTitleColor(.orange, for: .normal)
        button.layer.cornerRadius = 10
        return button
    }()
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        contentView.addSubview(applyButton)
        
        NSLayoutConstraint.activate([
            applyButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            applyButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            applyButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            applyButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            applyButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func updateUI(with viewModel: TableViewModel.ViewModelType.Button) {
        applyButton.setTitle(viewModel.title, for: .normal)
        applyButton.backgroundColor = viewModel.buttonColor?.withAlphaComponent(0.15)
        applyButton.setTitleColor(viewModel.titleColor, for: .normal)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        applyButton.setTitle("Применить промокод", for: .normal)
        applyButton.backgroundColor = .orange.withAlphaComponent(0.15)
        applyButton.setTitleColor(.orange, for: .normal)
    }
}
