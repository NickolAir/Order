import UIKit
class ReviewListViewModel {
    var navigateToReviewScreen: ((UIViewController) -> Void)?
    
    lazy var cellViewModels: [TableViewModel] = [
        .init(type: .info(TableViewModel.ViewModelType.TitleInfo(
            title: "Промокоды",
            info: "На один товар можно применить только два промокода"
        ))),
        
        .init(type: .button(TableViewModel.ViewModelType.Button(
            image: UIImage(named: "Shape"),
            title: "Добавить промокод",
            titleColor: UIColor.init(red: 1, green: 70/255, blue: 17/255, alpha: 1),
            buttonColor: UIColor.init(red: 1, green: 70/255, blue: 17/255, alpha: 0.1),
            buttonType: .Apply,
            action: { [weak self] in
                let reviewViewController = ReviewViewController()
                self?.navigateToReviewScreen?(reviewViewController)
            }
        ))),
        
        
    ]
}
