import SwiftUI

struct PromoCodeView: View {
    @Binding var promoCode: PromoCode
    let activateAction: () -> Void

    var body: some View {
        HStack(spacing: 16) {
            VStack(alignment: .leading, spacing: 5) {
                HStack {
                    Text(promoCode.code)
                        .font(.headline)
                        .fontWeight(.medium)

                    Text("-\(promoCode.discount)%")
                        .font(.caption)
                        .foregroundColor(.white)
                        .padding(.horizontal, 4)
                        .background(Color.green)
                        .cornerRadius(8)

                    Image(systemName: "info.circle")
                        .foregroundColor(.gray)
                }

                Text("По \(promoCode.expirationDate)")
                    .font(.caption)
                    .foregroundColor(.gray)

                if let description = promoCode.description {
                    Text(description)
                        .font(.caption2)
                        .foregroundColor(.gray)
                }
            }

            Spacer()

            Toggle("", isOn: $promoCode.isActive)
                .toggleStyle(SwitchToggleStyle(tint: Color(r: 255, g: 70, b: 17)))
                .onChange(of: promoCode.isActive) { newValue in
                    if newValue {
                        activateAction()
                    }
                }
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(12)
    }
}
