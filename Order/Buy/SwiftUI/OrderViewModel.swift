import SwiftUI

class OrderViewModel: ObservableObject {
    @Published var products: [Product] = [
        Product(
            title: "Золотое плоское обручальное кольцо 4 мм",
            subtitle: nil,
            imageURL: "https://s3-alpha-sig.figma.com/img/0107/0af6/3297f40e81f4a6e2f72d2ce876867dac?Expires=1734912000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=egIYaCrnirIMW0xs776XVqu7dM8uTUMJNW~~HdhAQrXa~2Cdiiveu~39PC3vmrFBNzJ003vXeGxrRVhNU2T-yqmJdQ-REQiw53NIhl-eYO7CKssTHJT7hrcUwTUL-Ji7Wv6Mriv6sH9cxEAXygurZoUUUoWNl~UmtW1Hsq7f~rvodRBbskjKXdUWx6ub9oUtyOo7CCPI6V2z~sVQfAcsD3T02EOSpumKSa~8XmvttdpaWgS07vdaR6JX6mWReXhX0xhhPbvQRRV9EQ3YDw57bNgGTSrggovoe3qmNuHh~YkObodoMw-iui1dlkxzl~QmRR9nIrIf8x0DrPPc5zc7CQ__",
            arrowHide: true,
            quantity: 1,
            size: "17",
            price: 26642.40,
            originalPrice: 32217.00,
            discount: 40),
        
        Product(
            title: "Золотое плоское обручальное кольцо 4 мм",
            subtitle: nil,
            imageURL: "https://s3-alpha-sig.figma.com/img/0107/0af6/3297f40e81f4a6e2f72d2ce876867dac?Expires=1734912000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=egIYaCrnirIMW0xs776XVqu7dM8uTUMJNW~~HdhAQrXa~2Cdiiveu~39PC3vmrFBNzJ003vXeGxrRVhNU2T-yqmJdQ-REQiw53NIhl-eYO7CKssTHJT7hrcUwTUL-Ji7Wv6Mriv6sH9cxEAXygurZoUUUoWNl~UmtW1Hsq7f~rvodRBbskjKXdUWx6ub9oUtyOo7CCPI6V2z~sVQfAcsD3T02EOSpumKSa~8XmvttdpaWgS07vdaR6JX6mWReXhX0xhhPbvQRRV9EQ3YDw57bNgGTSrggovoe3qmNuHh~YkObodoMw-iui1dlkxzl~QmRR9nIrIf8x0DrPPc5zc7CQ__",
            arrowHide: true,
            quantity: 1,
            size: "17",
            price: 26642.40,
            originalPrice: 32217.00,
            discount: 40),
    ]
    
    @Published var payments: [PaymentModel] = [
        .init(title: "SberPay", subtitle: "Через приложение Сбербанк", imageName: "sber", discount: 5, cashback: 5),
        .init(title: "Банковской картой", subtitle: "Visa, Master Card, МИР", imageName: "card", discount: 5),
        .init(title: "Яндекс Пэй со Сплитом", subtitle: "Оплата частями", imageName: "yapay", discount: 5),
        .init(title: "Рассрочка Тинькофф", subtitle: "На 3 месяца без переплат", imageName: "tinkoff", discount: 5),
        .init(title: "Tinkoff Pay", subtitle: "Через приложение Тинькофф", imageName: "tinkoffpay", discount: 5),
        .init(title: "Оплатить при получении", subtitle: "Наличными или картой", imageName: "wallet")
    ]
}
