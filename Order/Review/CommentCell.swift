import UIKit

class CommentCell: UITableViewCell {
    
    var viewModel: TableViewModel.ViewModelType.CommentCell? {
        didSet {
            updateUI()
        }
    }
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .fill
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    private lazy var prosTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Достоинства"
        textField.borderStyle = .roundedRect
        textField.font = .systemFont(ofSize: 14)
        textField.backgroundColor = UIColor(white: 0.95, alpha: 1)
        textField.layer.cornerRadius = 8
        return textField
    }()
    
    private lazy var consTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Недостатки"
        textField.borderStyle = .roundedRect
        textField.font = .systemFont(ofSize: 14)
        textField.backgroundColor = UIColor(white: 0.95, alpha: 1)
        textField.layer.cornerRadius = 8
        return textField
    }()
    
    private lazy var commentTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Комментарий"
        textField.borderStyle = .roundedRect
        textField.font = .systemFont(ofSize: 14)
        textField.backgroundColor = UIColor(white: 0.95, alpha: 1)
        textField.layer.cornerRadius = 8
        return textField
    }()
    
    private lazy var checkBoxStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [checkBox, checkBoxLabel])
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.alignment = .center
        return stackView
    }()
    
    private lazy var checkBox: CheckBox = {
        let checkBox = CheckBox()
        checkBox.isChecked = false
        return checkBox
    }()
    
    private lazy var checkBoxLabel: UILabel = {
        let label = UILabel()
        label.text = "Оставить отзыв анонимно"
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Отправить", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.black, for: .highlighted)
        button.backgroundColor = UIColor(red: 1, green: 70/255, blue: 17/255, alpha: 1)
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(makeOrderTapAnimation), for: .touchUpInside)
        return button
    }()
    
    private lazy var underButtonLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 2
        let fullText = "Перед отправкой отзыва, пожалуйста,\n ознакомьтесь с правилами публикации"
        let attributedText = NSMutableAttributedString(string: fullText)

        attributedText.addAttribute(.foregroundColor, value: UIColor.gray, range: NSRange(location: 0, length: fullText.count))
        attributedText.addAttribute(.font, value: UIFont(name: "Roboto", size: 12) ?? .systemFont(ofSize: 12), range: NSRange(location: 0, length: fullText.count))

        let linkTextRange = (fullText as NSString).range(of: "правилами публикации")
        attributedText.addAttribute(.foregroundColor, value: UIColor.orange, range: linkTextRange)
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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        backgroundColor = .white
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        contentView.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
        
        stackView.addArrangedSubview(prosTextField)
        stackView.addArrangedSubview(consTextField)
        stackView.addArrangedSubview(commentTextField)
        stackView.addArrangedSubview(checkBoxStackView)
        stackView.addArrangedSubview(button)
        stackView.addArrangedSubview(underButtonLabel)
    }
    
    private func updateUI() {
       
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
    }
}
