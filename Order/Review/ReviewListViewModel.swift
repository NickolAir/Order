import UIKit
class ReviewListViewModel {
    var navigateToReviewScreen: ((UIViewController) -> Void)?
    
    lazy var cellViewModels: [TableViewModel] = [
        .init(type: .productCell(TableViewModel.ViewModelType.ProductCell(
            title: "Золотое плоское",
            subtitle: "обручальное кольцо 4 мм",
            imageName: "ring",
            arrowHide: false
        ))),
        
        .init(type: .productCell(TableViewModel.ViewModelType.ProductCell(
            title: "Золотое плоское",
            subtitle: "обручальное кольцо 4 мм",
            imageName: "ring2",
            arrowHide: false
        ))),
    
        .init(type: .productCell(TableViewModel.ViewModelType.ProductCell(
            title: "Золотое плоское",
            subtitle: "обручальное кольцо 4 мм",
            imageName: "ring3",
            arrowHide: false
        ))),
    
        .init(type: .productCell(TableViewModel.ViewModelType.ProductCell(
            title: "Золотое плоское",
            subtitle: "обручальное кольцо 4 мм",
            imageName: "ring4",
            arrowHide: false
        ))),
    ]
}
