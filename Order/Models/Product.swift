import Foundation
struct Product: Identifiable{
    let id = UUID()
    let title: String
    let subtitle: String?
    let quantity: Int?
    let size: String?
    let price: Double?
    let originalPrice: Double?
    let discount: Int
    let imageURL: String?
    var arrowHide: Bool
    let rating: RatingValue?
    
    init(title: String, subtitle: String?, imageURL: String?, arrowHide: Bool, rating: RatingValue? = nil) {
        self.title = title
        self.subtitle = subtitle
        self.imageURL = imageURL
        self.arrowHide = arrowHide
        self.rating = rating
        self.discount = 0 
        self.size = nil
        self.quantity = nil
        self.price = nil
        self.originalPrice = nil
    }
    
    init(title: String, subtitle: String?, imageURL: String?, arrowHide: Bool, rating: RatingValue? = nil, quantity: Int, size: String, price: Double, originalPrice: Double, discount: Int) {
        self.title = title
        self.subtitle = subtitle
        self.imageURL = imageURL
        self.arrowHide = arrowHide
        self.rating = rating
        self.quantity = quantity
        self.size = size
        self.price = price
        self.originalPrice = originalPrice
        self.discount = discount
    }
}

let products: [Product] = [
    Product(title: "Золотое плоское", subtitle: "обручальное кольцо 4 мм", imageURL: "https://s3-alpha-sig.figma.com/img/0107/0af6/3297f40e81f4a6e2f72d2ce876867dac?Expires=1734912000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=egIYaCrnirIMW0xs776XVqu7dM8uTUMJNW~~HdhAQrXa~2Cdiiveu~39PC3vmrFBNzJ003vXeGxrRVhNU2T-yqmJdQ-REQiw53NIhl-eYO7CKssTHJT7hrcUwTUL-Ji7Wv6Mriv6sH9cxEAXygurZoUUUoWNl~UmtW1Hsq7f~rvodRBbskjKXdUWx6ub9oUtyOo7CCPI6V2z~sVQfAcsD3T02EOSpumKSa~8XmvttdpaWgS07vdaR6JX6mWReXhX0xhhPbvQRRV9EQ3YDw57bNgGTSrggovoe3qmNuHh~YkObodoMw-iui1dlkxzl~QmRR9nIrIf8x0DrPPc5zc7CQ__", arrowHide: false),
    Product(title: "Золотое плоское", subtitle: "обручальное кольцо 4 мм", imageURL: "https://s3-alpha-sig.figma.com/img/1872/894f/058de0bea04d50ed6858533562b1149d?Expires=1734912000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=ZVRBIXxe2ShfgcxacvxO4S2a-R4lMQuxpn9ilrR04rdHwJLiKlhyfMEk7tMdswRjyG30rdgV4aGSk0qtMELS98qy5NF57R1Daqf6BrESdNAzhhlVDuC1W~D-yi8T9UJXXIrjrRbsKKKuJKpgBkFs5NBk~cSB-x62bM1szX~Gfxq7xHKrZflsBvcIeSJQfKKtLT68tM-LCr51mSBbnqRbQV4b467uJzGeCt2-99mfsvbQ~RVZrvzeX9ay8Fhx0JTvma5AlXXycNnpFnlmJ-MJVBPvkpJdKtVMK3NSW0Am5FPuKXFHfPb3RHlAYaFSX6YR0~wbDq4qWDR-H11~tCwoAw__", arrowHide: false),
    Product(title: "Золотое плоское", subtitle: "обручальное кольцо 4 мм", imageURL: "https://s3-alpha-sig.figma.com/img/0107/0af6/3297f40e81f4a6e2f72d2ce876867dac?Expires=1734912000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=egIYaCrnirIMW0xs776XVqu7dM8uTUMJNW~~HdhAQrXa~2Cdiiveu~39PC3vmrFBNzJ003vXeGxrRVhNU2T-yqmJdQ-REQiw53NIhl-eYO7CKssTHJT7hrcUwTUL-Ji7Wv6Mriv6sH9cxEAXygurZoUUUoWNl~UmtW1Hsq7f~rvodRBbskjKXdUWx6ub9oUtyOo7CCPI6V2z~sVQfAcsD3T02EOSpumKSa~8XmvttdpaWgS07vdaR6JX6mWReXhX0xhhPbvQRRV9EQ3YDw57bNgGTSrggovoe3qmNuHh~YkObodoMw-iui1dlkxzl~QmRR9nIrIf8x0DrPPc5zc7CQ__", arrowHide: false),
    Product(title: "Золотое плоское", subtitle: "обручальное кольцо 4 мм", imageURL: "https://s3-alpha-sig.figma.com/img/1872/894f/058de0bea04d50ed6858533562b1149d?Expires=1734912000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=ZVRBIXxe2ShfgcxacvxO4S2a-R4lMQuxpn9ilrR04rdHwJLiKlhyfMEk7tMdswRjyG30rdgV4aGSk0qtMELS98qy5NF57R1Daqf6BrESdNAzhhlVDuC1W~D-yi8T9UJXXIrjrRbsKKKuJKpgBkFs5NBk~cSB-x62bM1szX~Gfxq7xHKrZflsBvcIeSJQfKKtLT68tM-LCr51mSBbnqRbQV4b467uJzGeCt2-99mfsvbQ~RVZrvzeX9ay8Fhx0JTvma5AlXXycNnpFnlmJ-MJVBPvkpJdKtVMK3NSW0Am5FPuKXFHfPb3RHlAYaFSX6YR0~wbDq4qWDR-H11~tCwoAw__", arrowHide: false),
]
