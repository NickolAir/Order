
import UIKit
class ViewModel {
    lazy var cellViewModels: [TableViewModel] = [
        .init(type: .info(TableViewModel.ViewModelType.TitleInfo(
            title: "Промокоды",
            info: "На один товар можно применить только два промокода"
        ))),
        
        .init(type: .button(TableViewModel.ViewModelType.Button(
            image: UIImage(named: "Shape"),
            title: "Добавить промокод",
            titleColor: .orange,
            buttonColor: .orange.withAlphaComponent(0.15),
            buttonType: .Apply,
            action: {
                return
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
            titleColor: .red,
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
