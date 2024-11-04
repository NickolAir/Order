import UIKit

class ProductCell: UITableViewCell {
    
    var viewModel: TableViewModel.ViewModelType.ProductCell? {
        didSet {
            updateUI()
        }
    }
    
    private lazy var mainView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var descriptionView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var picture: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var title: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.numberOfLines = 2
        label.textColor = .black
        return label
    }()
    
    private lazy var subtitle: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.numberOfLines = 2
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
               return 80
           case .imageHeight:
               return 80
           }
       }
    }
   
   enum TitleConstraints {
       case topPadding
       case bottomPadding
       case height
       var value: CGFloat {
           switch self {
           case .bottomPadding:
               return -8
           case .topPadding:
               return 8
           case .height:
               return 20
           }
       }
   }
   
   enum ChevronImageViewConstraints {
       case width
       case height
       var value: CGFloat {
           switch self {
           case .height:
               return 45
           case .width:
               return 25
           }
       }
   }
    
    enum DescriptionViewConstraints {
        case topPadding
        case bottomPadding
        case leftPadding
        var value: CGFloat {
            switch self {
            case .bottomPadding:
                return -8
            case .topPadding:
                return 8
            case .leftPadding:
                return 12
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
        contentView.addSubview(mainView)
        mainView.translatesAutoresizingMaskIntoConstraints = false
        
        mainView.addSubview(picture)
        picture.translatesAutoresizingMaskIntoConstraints = false
        
        mainView.addSubview(descriptionView)
        descriptionView.translatesAutoresizingMaskIntoConstraints = false
        
        descriptionView.addSubview(chevronImage)
        chevronImage.translatesAutoresizingMaskIntoConstraints = false
        
        descriptionView.addSubview(title)
        title.translatesAutoresizingMaskIntoConstraints = false
        
        descriptionView.addSubview(subtitle)
        subtitle.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: CellConstraints.topPadding.value),
            mainView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: CellConstraints.bottomPadding.value),
            mainView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: CellConstraints.leftPadding.value),
            mainView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: CellConstraints.rightPadding.value),
            
            descriptionView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: DescriptionViewConstraints.topPadding.value),
            descriptionView.rightAnchor.constraint(equalTo: mainView.rightAnchor),
            descriptionView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: DescriptionViewConstraints.bottomPadding.value),
            descriptionView.leftAnchor.constraint(equalTo: picture.rightAnchor, constant: DescriptionViewConstraints.leftPadding.value),
            
            picture.leftAnchor.constraint(equalTo: mainView.leftAnchor),
            picture.widthAnchor.constraint(equalToConstant: ImageConstraints.imageWidth.value),
            picture.topAnchor.constraint(equalTo: mainView.topAnchor),
            picture.bottomAnchor.constraint(equalTo: mainView.bottomAnchor),
            picture.heightAnchor.constraint(equalToConstant: ImageConstraints.imageHeight.value),
            
            chevronImage.rightAnchor.constraint(equalTo: descriptionView.rightAnchor),
            chevronImage.centerYAnchor.constraint(equalTo: descriptionView.centerYAnchor),
            chevronImage.widthAnchor.constraint(equalToConstant: ChevronImageViewConstraints.width.value),
            chevronImage.heightAnchor.constraint(equalToConstant: ChevronImageViewConstraints.height.value),
            
            title.leftAnchor.constraint(equalTo: descriptionView.leftAnchor),
            title.topAnchor.constraint(equalTo: descriptionView.topAnchor),
            title.rightAnchor.constraint(equalTo: chevronImage.leftAnchor),
            title.heightAnchor.constraint(equalToConstant: TitleConstraints.height.value),
            
            subtitle.leftAnchor.constraint(equalTo: descriptionView.leftAnchor),
            subtitle.rightAnchor.constraint(equalTo: descriptionView.rightAnchor),
            subtitle.topAnchor.constraint(equalTo: title.bottomAnchor, constant: TitleConstraints.topPadding.value),
            subtitle.heightAnchor.constraint(equalToConstant: TitleConstraints.height.value),
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
