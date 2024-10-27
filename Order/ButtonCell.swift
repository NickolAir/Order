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
        button.tintColor = UIColor.init(red: 1, green: 70/255, blue: 17/255, alpha: 1)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.addTarget(self, action: #selector(animateButtonTouchDown), for: .touchDown)
        button.addTarget(self, action: #selector(animateButtonTouchUp), for: [.touchUpInside, .touchUpOutside, .touchCancel])
        
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
        
        switch viewModel.buttonType {
        case .Apply:
            button.backgroundColor = viewModel.buttonColor
            button.contentHorizontalAlignment = .center
        case .Hide:
            button.backgroundColor = viewModel.buttonColor
            button.contentHorizontalAlignment = .left
        case .Common:
            button.backgroundColor = viewModel.buttonColor
            button.contentHorizontalAlignment = .center
        }
        
        if let image = viewModel.image {
            let tintedImage = image.withRenderingMode(.alwaysTemplate)
            button.setImage(tintedImage, for: .normal)
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
            
        case .Common:
            buttonConstraints = [
                button.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
                button.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
                button.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
                button.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
                button.heightAnchor.constraint(equalToConstant: 50)
            ]
            button.contentHorizontalAlignment = .center
        }
        
        NSLayoutConstraint.activate(buttonConstraints)
    }
    
    @objc private func buttonTapped() {
        viewModel?.action?()
    }
    
    @objc private func animateButtonTouchDown() {
        UIView.animate(withDuration: 0.1) {
            self.button.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
            self.button.alpha = 0.8
        }
    }
    
    @objc private func animateButtonTouchUp() {
        UIView.animate(withDuration: 0.1) {
            self.button.transform = CGAffineTransform.identity
            self.button.alpha = 1.0
        }
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
