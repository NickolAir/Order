import UIKit

class ReviewViewController: UIViewController {
    
    private let viewModel = ReviewViewModel()
    private var review: Review
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(ProductCell.self, forCellReuseIdentifier: String(describing: ProductCell.self))
        tableView.register(CommentCell.self, forCellReuseIdentifier: String(describing: CommentCell.self))
        tableView.register(RatingCell.self, forCellReuseIdentifier: String(describing: RatingCell.self))
        tableView.register(PhotoCollectionView.self, forCellReuseIdentifier: String(describing: PhotoCollectionView.self))
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Напишите отзыв"
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        view.backgroundColor = .white
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        viewModel.dataUpdated = tableView.reloadData
        review.product.arrowHide = true
        viewModel.createTable(review: review)
    }
    
    @objc private func keyboardWillShow(notification: NSNotification) {
       guard let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return }
       let keyboardHeight = keyboardFrame.height
       tableView.contentInset.bottom = keyboardHeight
       tableView.verticalScrollIndicatorInsets.bottom = keyboardHeight
   }
           
   @objc private func keyboardWillHide(notification: NSNotification) {
       tableView.contentInset.bottom = 0
       tableView.verticalScrollIndicatorInsets.bottom = 0
   }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if let cell = textField.superview?.superview as? UITableViewCell, let indexPath = tableView.indexPath(for: cell) {
            tableView.scrollToRow(at: indexPath, at: .middle, animated: true)
        }
    }
        
    init(review: Review) {
        self.review = review
        super.init(nibName: nil, bundle: nil)
    }
    
    init() {
        self.review = testReview
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ReviewViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.cellViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewModel = self.viewModel.cellViewModels[indexPath.row]
        
        switch viewModel.type {
        case .promo(let promo):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PromoCell.self)) as? PromoCell else {
                return UITableViewCell()
            }
            
            cell.viewModel = promo
            return cell
        case .info(let info):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TitleCell.self)) as? TitleCell else {
                return UITableViewCell()
            }
            
            cell.viewModel = info
            return cell
        case .result(let result):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: OrderCell.self)) as? OrderCell else {
                return UITableViewCell()
            }
            
            cell.viewModel = result
            return cell

        case .button(let button):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ButtonCell.self)) as? ButtonCell else {
                return UITableViewCell()
            }
            
            cell.viewModel = button
            return cell
        case .promoField(let promoField):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PromoFieldCell.self)) as? PromoFieldCell else {
                return UITableViewCell()
            }
            
            cell.viewModel = promoField
            return cell
        case .productCell (let product):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ProductCell.self)) as? ProductCell else {
                return UITableViewCell()
            }
            
            cell.viewModel = product
            return cell
        case .ratingCell(let rating):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RatingCell.self)) as? RatingCell else {
                return UITableViewCell()
            }
            
            cell.viewModel = rating
            return cell
        case .commentCell(let comment):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CommentCell.self)) as? CommentCell else {
                return UITableViewCell()
            }
            
            cell.viewModel = comment
            return cell
        case .photoCell(let photoCollection):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PhotoCollectionView.self)) as? PhotoCollectionView else {
                return UITableViewCell()
            }
            
            cell.viewModel = photoCollection
            cell.dataUpdated = { [weak self] in
                self?.tableView.beginUpdates()
                self?.tableView.endUpdates()
            }
            cell.selectionStyle = .none
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       let viewModel = self.viewModel.cellViewModels[indexPath.row]
       
       switch viewModel.type {
       case .photoCell(let photoCollection):
           guard let cell = tableView.cellForRow(at: indexPath) as? PhotoCollectionView else {
               let cell = PhotoCollectionView(style: .default, reuseIdentifier: String(describing: PhotoCollectionView.self))
               cell.viewModel = photoCollection
               return cell.requiredHeight()
           }
           
           return cell.requiredHeight()
           
       default:
           return UITableView.automaticDimension
       }
   }
}
