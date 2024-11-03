import UIKit
class ReviewViewModel {
    lazy var cellViewModels: [TableViewModel] = [
        .init(type: .info(TableViewModel.ViewModelType.TitleInfo(
            title: "Промокоды",
            info: "На один товар можно применить только два промокода"
        )))
        
    ]
}
