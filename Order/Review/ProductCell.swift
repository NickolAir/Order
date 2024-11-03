import UIKit

class ProductCell: UITableViewCell {
    
    var viewModel: TableViewModel.ViewModelType.ProductCell? {
        didSet {
            updateUI()
        }
    }
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        backgroundColor = .white
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        
    }
    
    private func updateUI() {
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
    }
}
