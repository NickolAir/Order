import UIKit
class ReviewViewModel {
    lazy var cellViewModels: [TableViewModel] = []
        
    var dataUpdated: (() -> Void)?
    
    func createTable(review: Review) {
        cellViewModels.append(.init(type: .productCell(TableViewModel.ViewModelType.ProductCell(
            title: review.product.title,
            subtitle: review.product.subtitle,
            imageName: review.product.imageName,
            arrowHide: review.product.arrowHide
        ))))
        
        cellViewModels.append(.init(type: .ratingCell(TableViewModel.ViewModelType.RatingCell(
            ratingLabel: review.rating
        ))))
        
        cellViewModels.append(.init(type: .commentCell(TableViewModel.ViewModelType.CommentCell(
            advantages: review.advantages,
            disadvantages: review.disadvantages,
            comment: review.comment,
            checkBoxTitle: review.checkBoxTitle
        ))))
    }
}
