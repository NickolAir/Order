import SwiftUI

struct PromoCodeListView: View {
    @StateObject private var viewModel = OrderViewModel()

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Промокоды")
                .font(.largeTitle)
                .bold()
            
            Text("На один товар можно применить только один промокод")
                .font(.subheadline)
                .foregroundColor(.gray)

            Button(action: {
                
            }) {
                HStack {
                    Image("Shape")
                    Text("Применить промокод")
                        .bold()
                }
                .font(.callout)
                .foregroundColor(Color(r: 255, g: 70, b: 17))
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color(r: 255, g: 70, b: 17).opacity(0.15))
                .cornerRadius(12)
            }

            if viewModel.isPromoListVisible {
                VStack(spacing: 8) {
                    ForEach($viewModel.promoCodes) { $promoCode in
                        PromoCodeView(promoCode: $promoCode) {
                            viewModel.activatePromoCode(promoCode)
                        }
                    }
                }
                .transition(.slide)
            }

            Button(action: {
                withAnimation {
                    viewModel.togglePromoListVisibility() 
                }
            }) {
                Text(viewModel.isPromoListVisible ? "Скрыть промокоды" : "Показать промокоды")
                    .font(.callout)
                    .foregroundColor(Color(r: 255, g: 70, b: 17))
                    .bold()
                    .padding(.leading, 10)
            }
        }
        .padding()
    }
}
