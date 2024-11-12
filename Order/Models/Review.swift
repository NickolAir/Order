struct Review {
    var product: Product
    var rating: RatingValue?
    var advantages: String?
    var disadvantages: String?
    var comment: String?
    var checkBoxTitle: String?
}

var testReview: Review = Review(product: products[0])
