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
            }
            .padding()
            .navigationTitle("Оформление заказа")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: BackButton())
            
            VStack {
                Rectangle()
                    .fill(Color.gray.opacity(0.1))
                    .frame(maxWidth: .infinity)
                    .frame(height: 20)
            }
            
            VStack(alignment: .leading) {
                Text("Способ оплаты")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                
                VStack(alignment: .leading, spacing: 16) {
                    ForEach(viewModel.payments) { payment in
                        PaymentView(payment: payment)
                            .padding(.horizontal, 12)
                    }
                }
            }
            
            VStack {
                Rectangle()
                    .fill(Color.gray.opacity(0.1))
                    .frame(maxWidth: .infinity)
                    .frame(height: 20)
            }
            
            VStack {
                PromoCodeListView()
            }
        }
    }
}

#Preview {
    OrderView()
}
