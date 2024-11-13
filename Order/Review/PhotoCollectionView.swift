import UIKit

class PhotoCollectionView: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    enum Constants {
        static let padding: CGFloat = 10
        static let number: CGFloat = 4
    }
    
    var dataUpdated: (() -> Void)?
    
    func deleteCell(cell: PhotoCollectionViewCell) {
        guard let indexPath = collectionView.indexPath(for: cell) else { return }
        
        let deletedImage = displayedImages.remove(at: indexPath.item)
        
        allImages.removeAll(where: { value in
            return value == deletedImage
        })
        allImages.append(deletedImage)
        
        collectionView.performBatchUpdates({
            collectionView.deleteItems(at: [indexPath])
        }, completion: { _ in
            if self.displayedImages.count < self.allImages.count {
                self.isAddIconShown = true
            }
            self.collectionView.reloadData()
            self.dataUpdated?()
            
        })
    }
    
    var viewModel: TableViewModel.ViewModelType.PhotoCell? {
        didSet {
            updateUI()
        }
    }
    
    private lazy var addNewCellImage: UIImage = {
        let image = UIImage(named: "cloud") ?? UIImage()
        return image
    }()
    
    private var allImages: [UIImage] = []
    private var displayedImages: [UIImage] = []
    private var isAddIconShown = true
    
    func requiredHeight() -> CGFloat {
        let numberOfItemsPerRow: CGFloat = 4
        let spacing: CGFloat = 8
        let itemHeight = (UIScreen.main.bounds.width - (numberOfItemsPerRow + 1) * spacing) / numberOfItemsPerRow
        let rows = ceil(CGFloat(displayedImages.count + 1) / numberOfItemsPerRow)
        let result = rows * itemHeight + (rows + 1) * spacing
        return result
    }
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 8
        layout.minimumLineSpacing = 8
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: PhotoCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isScrollEnabled = false
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with images: [UIImage]) {
        self.allImages = images
        displayedImages = []
        collectionView.reloadData()
    }
    
    func setupUI() {
        contentView.addSubview(collectionView)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            collectionView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16),
            collectionView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }
    
    
    func updateUI() {
        guard let viewModel else { return }
        for imageName in viewModel.imageNames {
            if let image = UIImage(named: imageName) {
                self.allImages.append(image)
            }
        }
        
        collectionView.reloadData()
    }
}

extension PhotoCollectionView {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return displayedImages.count + (isAddIconShown ? 1 : 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionViewCell.identifier, for: indexPath) as! PhotoCollectionViewCell
        if indexPath.item < allImages.count {
            if indexPath.item < displayedImages.count {
                cell.configure(with: displayedImages[indexPath.item], isDeleteable: true, deleteClousure: deleteCell(cell:))
            } else {
                cell.configure(with: addNewCellImage, isDeleteable: false)
            }
            return cell
        } else {
            cell.configure(with: addNewCellImage, isDeleteable: false)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.item == displayedImages.count && isAddIconShown {
            addNextImage()
        }
    }
    
    func addNextImage() {
        guard displayedImages.count < allImages.count else { return }
        displayedImages.append(allImages[displayedImages.count])
        if displayedImages.count == allImages.count {
            isAddIconShown = false
        }

        collectionView.reloadData()
        dataUpdated?()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let totalPadding = Constants.padding * (Constants.number + 1)
        let itemWidth = (collectionView.bounds.width - totalPadding) / Constants.number
        return CGSize(width: itemWidth, height: itemWidth)
    }
    
}
