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
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    private var buttonConstraints: [NSLayoutConstraint] = []
    
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
    }
    
    private func updateUI(with viewModel: TableViewModel.ViewModelType.Button) {
        NSLayoutConstraint.deactivate(buttonConstraints)
        buttonConstraints.removeAll()
        
        button.setTitle(viewModel.title, for: .normal)
        button.setTitleColor(viewModel.titleColor ?? .systemRed, for: .normal)
        button.backgroundColor = viewModel.buttonType == .Apply ? viewModel.buttonColor?.withAlphaComponent(0.15) : .clear
        button.contentHorizontalAlignment = viewModel.buttonType == .Hide ? .left : .center
        
        if let image = viewModel.image {
            button.setImage(image, for: .normal)
            button.imageView?.contentMode = .scaleAspectFit
            button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -10, bottom: 0, right: 0)
        }
        
        switch viewModel.buttonType {
        case .Apply :
            buttonConstraints = [
                button.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
                button.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
                button.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
                button.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
                button.heightAnchor.constraint(equalToConstant: 50)
            ]
            button.contentHorizontalAlignment = .center
            
        case .Hide :
            buttonConstraints = [
                button.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
                button.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
                button.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
            ]
            button.contentHorizontalAlignment = .left
            
        default:
            buttonConstraints = [
                button.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
                button.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
                button.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
                button.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
            ]
            button.contentHorizontalAlignment = .center
        }
        
        NSLayoutConstraint.activate(buttonConstraints)
    }
    
    @objc private func buttonTapped() {
        viewModel?.action?()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        button.setTitle(nil, for: .normal)
        button.backgroundColor = nil
        button.setTitleColor(nil, for: .normal)
        button.setImage(nil, for: .normal)
        button.contentHorizontalAlignment = .center
    }
}
