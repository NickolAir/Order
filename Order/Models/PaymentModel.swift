import Foundation
struct PaymentModel: Identifiable{
    var id = UUID()
    let title: String
    let subtitle: String
    let imageName: String
    let discount: Int?
    let cashback: Int?
    
    init(id: UUID = UUID(), title: String, subtitle: String, imageName: String, discount: Int, cashback: Int) {
        self.id = id
        self.title = title
        self.subtitle = subtitle
        self.imageName = imageName
        self.discount = discount
        self.cashback = cashback
    }
    
    init(id: UUID = UUID(), title: String, subtitle: String, imageName: String, discount: Int) {
        self.id = id
        self.title = title
        self.subtitle = subtitle
        self.imageName = imageName
        self.discount = discount
        self.cashback = nil
    }
    
    init(id: UUID = UUID(), title: String, subtitle: String, imageName: String) {
        self.id = id
        self.title = title
        self.subtitle = subtitle
        self.imageName = imageName
        self.discount = nil
        self.cashback = nil
    }
}
