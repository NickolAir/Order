import SwiftUI

struct PromoCode: Identifiable {
    let id = UUID() 
    let code: String
    let discount: Int
    let expirationDate: String
    let description: String?
    var isActive: Bool
}
