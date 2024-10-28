import UIKit

class PromoFieldCell: UITableViewCell {
    var viewModel: TableViewModel.ViewModelType.PromoField? {
        didSet {
            guard let viewModel = viewModel else { return }
            updateUI(with: viewModel)
        }
    }
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, textField, errorLabel])
        stackView.axis = .vertical
        stackView.spacing = 10
        return stackView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textColor = .gray.withAlphaComponent(0.8)
        return label
    }()
    
    private lazy var errorLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.textColor = .red
        label.isHidden = true
        return label
    }()
    
    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.layer.cornerRadius = 10
        textField.rightView = crossButton
        textField.rightViewMode = .whileEditing
        textField.contentVerticalAlignment = .bottom
        let leftPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: 1))
        textField.leftView = leftPaddingView
        textField.leftViewMode = .always
        return textField
    }()
    
    private lazy var crossButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "Cross"), for: .normal)
        button.tintColor = .gray
        button.addTarget(self, action: #selector(clearTextField), for: .touchUpInside)
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
        contentView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        textField.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        textField.addSubview(crossButton)
        crossButton.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            
            titleLabel.leadingAnchor.constraint(equalTo: textField.leadingAnchor, constant: 14),
            titleLabel.topAnchor.constraint(equalTo: textField.topAnchor, constant: 4),
            titleLabel.trailingAnchor.constraint(lessThanOrEqualTo: textField.trailingAnchor, constant: -8),
            
            crossButton.centerYAnchor.constraint(equalTo: textField.centerYAnchor),
            
            textField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            textField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            textField.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            textField.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            textField.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    private func updateUI(with viewModel: TableViewModel.ViewModelType.PromoField) {
        titleLabel.text = viewModel.title
        errorLabel.text = viewModel.errorMessage
        errorLabel.isHidden = ((viewModel.errorMessage?.isEmpty) != nil)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        textField.text = nil
        errorLabel.isHidden = true
    }
    
    @objc private func clearTextField() {
        textField.text = ""
    }
}
