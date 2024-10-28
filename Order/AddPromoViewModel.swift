import UIKit

class AddPromoViewModel {
    lazy var cellModels: [TableViewModel] = [
        .init(type: .promoField(TableViewModel.ViewModelType.PromoField(
            promocode: "",
            title: "Введите код",
            errorMessage: "К сожалению, данного промокода не существует",
            action: {
                return
            }
        ))),
    
        .init(type: .button(TableViewModel.ViewModelType.Button(
            image: nil,
            title: "Применить",
            titleColor: .white,
            buttonColor: UIColor.init(red: 1, green: 70/255, blue: 17/255, alpha: 1),
            buttonType: .Common,
            action: {
                return
            }
    )))
    ]
    
    func togglePromo(value: Bool, id: String) {
        _ = cellModels.first(where: { value in
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
