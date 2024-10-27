
import UIKit
class ViewModel {
    var navigateToPromoScreen: ((UIViewController) -> Void)?
    
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
                let promoViewController = AddPromoViewController()
                self?.navigateToPromoScreen?(promoViewController)
            }
        ))),
        
        .init(type: .promo(TableViewModel.ViewModelType.Promo(
            title: "Промокод1",
            discount: "По 20 марта",
            percent: "10",
            info: "Только на хлеб",
            isActive: false,
            toggle: togglePromo
        ))),
        
        .init(type: .promo(TableViewModel.ViewModelType.Promo(
            title: "Промокод2",
            discount: "По 31 декабря",
            percent: "20",
            info: "Только на газированные напитки",
            isActive: false,
            toggle: togglePromo
        ))),
        
        .init(type: .button(TableViewModel.ViewModelType.Button(
            image: nil,
            title: "Скрыть промокоды",
            titleColor: UIColor.init(red: 1, green: 70/255, blue: 17/255, alpha: 1),
            buttonColor: .none,
            buttonType: .Hide,
            action: {
                return
            }
        ))),
        
        .init(type: .result(TableViewModel.ViewModelType.Result(
            summ: 5000.0,
            productsCount: 2,
            baseDiscount: 15.0,
            promocodesDiscount: 5.0,
            paymentDiscount: nil,
            price: 4250.0
        )))
    ]
    
    func togglePromo(value: Bool, id: String) {
        _ = cellViewModels.first(where: { value in
            switch value.type {
            case .promo(let promo):
                if promo.id == id {
                    return true
                }
            default:
                return false
            }

            return false
        })
    }
}
