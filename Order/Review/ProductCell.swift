import UIKit

class ProductCell: UITableViewCell {
    
    var viewModel: TableViewModel.ViewModelType.ProductCell? {
        didSet {
            updateUI()
        }
    }
    
    private lazy var picture: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var title: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()
    
    private lazy var subtitle: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()
    
    private lazy var chevronImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "chevron")
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .black
        return imageView
    }()
    
    private lazy var textStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [title, subtitle])
        stackView.axis = .vertical
        stackView.spacing = 4
        return stackView
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [picture, textStackView, chevronImage])
        stackView.axis = .horizontal
        stackView.spacing = 1
        return stackView
    }()
    
    enum CellConstraints {
        case leftPadding
        case rightPadding
        case topPadding
        case bottomPadding
        case height
       
       var value: CGFloat {
           switch self {
           case .leftPadding:
               return 20
           case .rightPadding:
               return -20
           case .topPadding:
               return 12
           case .bottomPadding:
               return -12
           case .height:
               return 100
            }
        }
    }
       
    enum ImageConstraints {
       case imageHeight
       case imageWidth
       var value: CGFloat {
           switch self {
           case .imageWidth:
               return 100
           case .imageHeight:
               return 100
           }
       }
    }
   
   enum TitleConstraints {
       case topPadding
       case bottomPadding
       var value: CGFloat {
           switch self {
           case .bottomPadding:
               return -8
           case .topPadding:
               return 8
           }
       }
   }
   
   enum ChevronImageViewConstraints {
       case width
       case height
       var value: CGFloat {
           switch self {
           case .height:
               return 14
           case .width:
               return 8
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
        textStackView.translatesAutoresizingMaskIntoConstraints = false
        picture.translatesAutoresizingMaskIntoConstraints = false
        chevronImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: CellConstraints.leftPadding.value),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: CellConstraints.rightPadding.value),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: CellConstraints.topPadding.value),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: CellConstraints.bottomPadding.value),
            stackView.heightAnchor.constraint(equalToConstant: CellConstraints.height.value),
            
            picture.widthAnchor.constraint(equalToConstant: ImageConstraints.imageWidth.value),
            picture.heightAnchor.constraint(equalToConstant: ImageConstraints.imageHeight.value),
            
            chevronImage.centerYAnchor.constraint(equalTo: stackView.centerYAnchor),
            chevronImage.rightAnchor.constraint(equalTo: textStackView.rightAnchor, constant: 40),
            
            title.topAnchor.constraint(equalTo: stackView.topAnchor, constant: 1),
            title.bottomAnchor.constraint(equalTo: subtitle.bottomAnchor, constant: 10),
            
            subtitle.bottomAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 1),
            subtitle.topAnchor.constraint(equalToSystemSpacingBelow: title.topAnchor, multiplier: 10),
        ])
    }
    
    private func updateUI() {
        guard let viewModel else { return }
        
        title.text = viewModel.title
        subtitle.text = viewModel.subtitle
        if let imageName = viewModel.imageName {
            picture.image = UIImage(named: imageName)
        }
        chevronImage.isHidden = viewModel.arrowHide
    }
    
    override func prepareForReuse() {
           super.prepareForReuse()
           picture.image = nil
           title.text = nil
           subtitle.text = nil
       }
}
