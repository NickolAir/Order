import SwiftUI

struct TotalSummaryView: View {
    var summary: Totals
    @State private var isShowingTotalScreen = false
    @StateObject private var viewModel = OrderViewModel()

    var body: some View {
        VStack(spacing: 16) {
            VStack(spacing: 8) {
                HStack {
                    Text("Цена за 2 товара")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Spacer()
                    Text("\(summary.itemsPrice.formattedWithSeparator()) ₽")
                        .font(.subheadline)
                }
                HStack {
                    Text("Скидки")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Spacer()
                    Text("-\(summary.discount.formattedWithSeparator()) ₽")
                        .font(.subheadline)
                        .foregroundColor(.red)
                }
                HStack {
                    HStack(spacing: 4) {
                        Text("Промокоды")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        Image(systemName: "info.circle")
                            .foregroundColor(.gray)
                            .font(.caption)
                    }
                    Spacer()
                    Text("-\(summary.promoCodeDiscount.formattedWithSeparator()) ₽")
                        .font(.subheadline)
                        .foregroundColor(.green)
                }
                HStack {
                    Text("Способ оплаты")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Spacer()
                    Text("-\(summary.paymentMethodDiscount.formattedWithSeparator()) ₽")
                        .font(.subheadline)
                        .foregroundColor(.black)
                }

                Divider()

                HStack {
                    Text("Итого")
                        .font(.headline)
                        .bold()
                    Spacer()
                    Text("\(summary.totalPrice.formattedWithSeparator()) ₽")
                        .font(.headline)
                        .bold()
                }
            }

            Button(action: {
                isShowingTotalScreen = true
            }) {
                Text("Оплатить")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color(r: 255, g: 70, b: 17))
                    .cornerRadius(12)
            }

            Text("Нажимая кнопку «Оформить заказ», вы соглашаетесь с Условиями оферты")
                .font(.caption)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
        }
        .padding()
        .background(.gray.opacity(0.1))
        .sheet(isPresented: $isShowingTotalScreen) {
            viewModel.totalScreens.randomElement()
        }
    }
}

extension Int {
    func formattedWithSeparator() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = " " 
        return formatter.string(from: NSNumber(value: self)) ?? "\(self)"
    }
}
