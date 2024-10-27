import UIKit

class ButtonCell: UITableViewCell {
    
    var viewModel: TableViewModel.ViewModelType.Button? {
        didSet {
            guard let viewModel = viewModel else { return }
            updateUI(with: viewModel)
        }
    }
    
    private lazy var button: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
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
        contentView.addSubview(button)
        
        selectionStyle = .none
        
        // Default constraints for button
        NSLayoutConstraint.activate([
            button.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            button.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            button.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            button.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }
    
    private func updateUI(with viewModel: TableViewModel.ViewModelType.Button) {
        // Configure button with properties from the view model
        if let title = viewModel.title {
            button.setTitle(title, for: .normal)
        }
        if let titleColor = viewModel.titleColor {
            button.setTitleColor(titleColor, for: .normal)
        }
        if let buttonColor = viewModel.buttonColor {
            button.backgroundColor = buttonColor.withAlphaComponent(0.15)
        }
        if let image = viewModel.image {
            button.setImage(image, for: .normal)
            button.semanticContentAttribute = .forceRightToLeft // Adjust image position if needed
        }
        
        // Set button action
        if let action = viewModel.action {
            button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        }
    }
    
    @objc private func buttonTapped() {
        viewModel?.action?() // Call the action closure
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        button.setTitle(nil, for: .normal)
        button.backgroundColor = .clear
        button.setTitleColor(.systemBlue, for: .normal) // Reset to default color
        button.setImage(nil, for: .normal)
    }
}
