import SwiftUI

struct OrderView: View {
    @StateObject private var viewModel = OrderViewModel() 

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                
                Text("Состав заказа")
                    .font(.largeTitle)
                    .bold()
                
                Text("Вы можете изменить параметры и состав заказа в")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                + Text(" корзине")
                    .font(.subheadline)
                    .foregroundColor(.red)
                
                
                VStack(spacing: 16) {
                    ForEach(viewModel.products) { product in
                        ProductView(product: product)
                            .padding(.horizontal)
                    }
                }
                Spacer()
            }
            .padding()
            .navigationTitle("Оформление заказа")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: BackButton())
        }
    }
}
