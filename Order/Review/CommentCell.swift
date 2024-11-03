import UIKit

class CommentCell: UITableViewCell {
    
    var viewModel: TableViewModel.ViewModelType.CommentCell? {
        didSet {
            updateUI()
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
        
    }
    
    private func updateUI() {
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
    }
}
