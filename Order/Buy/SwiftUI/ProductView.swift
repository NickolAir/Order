import SwiftUI

struct ProductView: View {
    let product: Product

    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            RemoteImageView(url: URL(string: product.imageURL!))

            VStack(alignment: .leading, spacing: 4) {
                Text(product.title)
                    .font(.subheadline)
                    .lineLimit(2)

                HStack {
                    Text("\(product.quantity!) шт.")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    if let size = product.size {
                        Text("Размер: \(size)")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }

                HStack(spacing: 8) {
                    Text("\(Int(product.originalPrice!)) ₽")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .strikethrough()

                    if product.discount > 0 {
                        Text("-\(product.discount)%")
                            .font(.caption)
                            .foregroundColor(.red)
                            .padding(.horizontal, 4)
                            .background(Color.red.opacity(0.1))
                            .cornerRadius(4)
                    }
                }

                Text("\(String(format: "%.2f", product.price!)) ₽")
                    .font(.title3)
                    .fontWeight(.bold)
            }

            Spacer()
        }
        .padding(.vertical, 8)
    }
}
