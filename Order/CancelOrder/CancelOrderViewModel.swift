import SwiftUI

class CancelOrderViewModel: ObservableObject {
    @Published var cancelOptions: [String] = []
    
    @Published var isMoneyNotification: Bool = false
    
    init(cancelOptions: [String] = ["Не подходит дата получения",
                                    "Часть товаров из заказа была отменена",
                                    "Не получилось применить скидку или промокод",
                                    "Хочу изменить заказ и оформить заново",
                                    "Нашелся товар дешевле"],
         isMoneyNotification: Bool = false) {
        self.isMoneyNotification = isMoneyNotification
        self.cancelOptions = cancelOptions
    }
}
