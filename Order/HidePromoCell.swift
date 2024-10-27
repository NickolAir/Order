import UIKit
class HidePromoCell: UITableViewCell {
    
    var viewModel: TableViewModel.ViewModelType.Button? {
        didSet {
            guard let viewModel = viewModel else { return }
            updateUI(with: viewModel)
        }
    }
    
    private lazy var hideButton: UIButton = {
        let hideButton = UIButton()
        hideButton.translatesAutoresizingMaskIntoConstraints = false
        
        hideButton.setTitle("Скрыть промокоды", for: .normal)
        hideButton.backgroundColor = .clear
        hideButton.setTitleColor(.systemRed, for: .normal)
        hideButton.contentHorizontalAlignment = .left
        hideButton.setContentHuggingPriority(.required, for: .horizontal)
        hideButton.setContentCompressionResistancePriority(.required, for: .horizontal)
        return hideButton
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
        contentView.addSubview(hideButton)
        
        NSLayoutConstraint.activate([
            hideButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            hideButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            hideButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }
    
    private func updateUI(with viewModel: TableViewModel.ViewModelType.Button) {
        hideButton.setTitle(viewModel.title, for: .normal)
        hideButton.backgroundColor = .none
        hideButton.setTitleColor(viewModel.titleColor, for: .normal)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        hideButton.setTitle("Скрыть промокоды", for: .normal)
        hideButton.backgroundColor = .none
        hideButton.setTitleColor(.red, for: .normal)
    }
}
