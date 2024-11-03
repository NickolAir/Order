import Foundation
import UIKit

struct TableViewModel {
    enum ViewModelType {
        struct Promo {
            let id: String = UUID().uuidString
            let title: String
            let discount: String
            let percent: String
            let info: String
            let isActive: Bool
            let toggle: ((Bool, String) -> Void)?
            
            init(title: String,
                 discount: String,
                 percent: String,
                 info: String,
                 isActive: Bool,
                 toggle: (((Bool, String) -> Void))? = nil) {
                self.title = title
                self.discount = discount
                self.percent = percent
                self.info = info
                self.isActive = isActive
                self.toggle = toggle
            }
        }
        
        struct TitleInfo {
            let title: String
            let info: String
        }
        
        struct Result {
            var summ: Double
            let productsCount: Int
            let baseDiscount: Double?
            var promocodesDiscount: Double
            let paymentDiscount: Double?
            let price: Double
        }
        
        struct Button {
            let image: UIImage?
            let title: String?
            let titleColor: UIColor?
            let buttonColor: UIColor?
            let buttonType: type
            let action: (() -> Void)? // Action closure
            
            enum type {
                case Hide
                case Apply
                case Common
            }
        }
        
        struct PromoField {
            let promocode: String?
            let title: String?
            let errorMessage: String?
            let action: (() -> Void)?
        }
        
        struct ProductCell {
            let title: String?
            let subtitle: String?
            let imageName: String?
            let arrowHide: Bool
        }
        
        struct CommentCell {
            
        }
        
        struct RatingCell {
            
        }
        
        case info(TitleInfo)
        case promo(Promo)
        case result(Result)
        case button(Button)
        case promoField(PromoField)
        case productCell(ProductCell)
        case ratingCell(RatingCell)
        case commentCell(CommentCell)
    }

    var type: ViewModelType
}
