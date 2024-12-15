import SwiftUI

class PromoCodeViewModel: ObservableObject {
    @Published var promoCodes: [PromoCode] = [
        PromoCode(code: "SECRETCODE", discount: 5, expirationDate: "31 марта", description: nil, isActive: true),
        PromoCode(code: "HELLO", discount: 5, expirationDate: "31 марта", description: "Промокод действует на первый заказ в приложении", isActive: false),
        PromoCode(code: "VESNA23", discount: 5, expirationDate: "31 марта", description: "Промокод действует для заказов от 30 000 ₽", isActive: false),
        PromoCode(code: "4300162112534", discount: 5, expirationDate: "31 марта", description: nil, isActive: false),
        PromoCode(code: "4300162112534", discount: 5, expirationDate: "31 марта", description: nil, isActive: false),
        PromoCode(code: "4300162112534", discount: 5, expirationDate: "31 марта", description: nil, isActive: false)
    ]
    
    @Published var isPromoListVisible: Bool = true // Управление видимостью списка

    func activatePromoCode(_ promoCode: PromoCode) {
        for index in promoCodes.indices {
            promoCodes[index].isActive = false
        }
        
        if let index = promoCodes.firstIndex(where: { $0.id == promoCode.id }) {
            promoCodes[index].isActive = true
        }
    }

    func togglePromoListVisibility() {
        isPromoListVisible.toggle()
    }
}
