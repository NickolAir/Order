import UIKit

class RatingCell: UITableViewCell {
    
    var viewModel: TableViewModel.ViewModelType.RatingCell? {
        didSet {
            updateUI()
        }
    }
    
    private lazy var starCount = 5

    private lazy var background: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.lightGray.withAlphaComponent(0.2)
        view.layer.cornerRadius = 10
        return view
    }()
    
    private lazy var ratingLabelView: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = UIColor.lightGray.withAlphaComponent(0.4)
        label.text = "Ваша оценка"
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 4
        return stackView
    }()
    
    private var starButtons: [UIButton] = []
    
    private var rating: RatingValue = RatingValue.none {
        didSet {
            updateStarColors()
        }
    }
    
    private var ratingLabelText: String = "" {
        didSet {
            ratingLabelView.text = ratingLabelText
        }
    }
       
    @objc private func starTapped(_ sender: UIButton) {
        guard let index = starButtons.firstIndex(of: sender) else { return }
        rating = RatingValue(rawValue: index + 1) ?? RatingValue.none
        if rating != .none {
            ratingLabelView.textColor = .black
        }
        ratingLabelText = rating.stringValue
    }
    
    private func updateStarColors() {
        for (index, button) in starButtons.enumerated() {
            button.isSelected = index < rating.rawValue
        }
    }
    
    enum BackgroundConstraints {
        case topPadding
        case bottomPadding
        case leftPadding
        case rightPadding
        var value: CGFloat {
            switch self {
            case .bottomPadding:
                return -8
            case .topPadding:
                return 8
            case .leftPadding:
                return 16
            case .rightPadding:
                return -16
            }
        }
    }
    
    enum StackViewConstraints {
        case rightPadding
        case topPadding
        case bottomPadding
        
        var value: CGFloat {
            switch self {
            case .bottomPadding:
                return -15
            case .topPadding:
                return 15
            case .rightPadding:
                return -16
            }
        }
    }
    
    enum RatingLabelViewConstraints {
        case leftPadding
        case topPadding
        case bottomPadding
        
        var value: CGFloat {
            switch self {
            case .bottomPadding:
                return -15
            case .topPadding:
                return 15
            case .leftPadding:
                return 16
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
      contentView.addSubview(background)
      background.translatesAutoresizingMaskIntoConstraints = false
      NSLayoutConstraint.activate([
          background.topAnchor.constraint(equalTo: contentView.topAnchor, constant: BackgroundConstraints.topPadding.value),
          background.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: BackgroundConstraints.bottomPadding.value),
          background.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: BackgroundConstraints.leftPadding.value),
          background.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: BackgroundConstraints.rightPadding.value)
          
      ])
      
      for _ in 0..<starCount {
          let button = UIButton(type: .custom)
          button.setImage(UIImage(named: "untap_star"), for: .normal)
          button.setImage(UIImage(named: "star"), for: .selected)
          button.addTarget(self, action: #selector(starTapped(_:)), for: .touchUpInside)
          starButtons.append(button)
          stackView.addArrangedSubview(button)
      }
      
      contentView.addSubview(stackView)
      stackView.translatesAutoresizingMaskIntoConstraints = false
      NSLayoutConstraint.activate([
          stackView.rightAnchor.constraint(equalTo: background.rightAnchor, constant: StackViewConstraints.rightPadding.value),
          stackView.topAnchor.constraint(equalTo: background.topAnchor, constant: StackViewConstraints.topPadding.value),
          stackView.bottomAnchor.constraint(equalTo: background.bottomAnchor, constant: StackViewConstraints.bottomPadding.value)
      ])
      
      contentView.addSubview(ratingLabelView)
      ratingLabelView.translatesAutoresizingMaskIntoConstraints = false
      NSLayoutConstraint.activate([
          ratingLabelView.leftAnchor.constraint(equalTo: background.leftAnchor, constant: RatingLabelViewConstraints.leftPadding.value),
          ratingLabelView.topAnchor.constraint(equalTo: background.topAnchor, constant: RatingLabelViewConstraints.topPadding.value),
          ratingLabelView.bottomAnchor.constraint(equalTo: background.bottomAnchor, constant: RatingLabelViewConstraints.bottomPadding.value)
      ])
      }
      
      private func updateUI() {
          guard let viewModel else { return }
          if let rating = viewModel.ratingLabel {
              self.rating = rating
          }
      }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
    }
}

enum RatingValue: Int {
    case none = 0
    case awful = 1
    case bad = 2
    case norm = 3
    case good = 4
    case great = 5
    
    var stringValue: String {
        switch self {
        case .none:
            return "Ваша оценка"
        case .awful:
            return "Ужасно"
        case .bad:
            return "Плохо"
        case .norm:
            return "Нормально"
        case .good:
            return "Хорошо"
        case .great:
            return "Отлично"
        }
    }
}
