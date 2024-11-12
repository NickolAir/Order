struct Product {
    
    let title: String?
    let subtitle: String?
    let imageName: String?
    var arrowHide: Bool
    var rating: RatingValue?
    
    init(title: String?, subtitle: String?, imageName: String?, arrowHide: Bool, rating: RatingValue? = nil) {
        self.title = title
        self.subtitle = subtitle
        self.imageName = imageName
        self.arrowHide = arrowHide
        self.rating = rating
    }
}

let products: [Product] = [
    Product(title: "Золотое плоское", subtitle: "обручальное кольцо 4 мм", imageName: "ring", arrowHide: false),
    Product(title: "Золотое плоское", subtitle: "обручальное кольцо 4 мм", imageName: "ring2", arrowHide: false),
    Product(title: "Золотое плоское", subtitle: "обручальное кольцо 4 мм", imageName: "ring3", arrowHide: false),
    Product(title: "Золотое плоское", subtitle: "обручальное кольцо 4 мм", imageName: "ring4", arrowHide: false),
]
