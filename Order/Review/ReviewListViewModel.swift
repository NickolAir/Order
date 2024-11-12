import UIKit
class ReviewListViewModel {
    var navigateToReviewScreen: ((UIViewController) -> Void)?
    
    var dataUpdated: (() -> Void)?
    
    lazy var cellViewModels: [TableViewModel] = []
    
    func createTable(products: [Product]) {
        cellViewModels.removeAll()
        for product in products {
            cellViewModels.append(.init(type: .productCell(TableViewModel.ViewModelType.ProductCell(
            title: product.title,
            subtitle: product.subtitle,
            imageName: product.imageName,
            arrowHide: product.arrowHide))))
        }
    }
}
