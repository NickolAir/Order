import SwiftUI

struct PaymentView: View {
    @Binding var payment: PaymentModel
    let activateAction: () -> ()
    
    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            Image(payment.imageName)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 30, maxHeight: 30)
                .padding(.top, 5)
            
            VStack(alignment: .leading, spacing: 5) {
                HStack {
                    Text(payment.title)
                        .font(.headline)
                        .fontWeight(.medium)
                
                    if let discountValue = payment.discount {
                        Text("-\(discountValue)%")
                            .font(.caption)
                            .foregroundColor(.white)
                            .padding(.horizontal, 4)
                            .background(.black)
                            .cornerRadius(8)
                    }
                    
                    if let cashbackValue = payment.cashback {
                        Text("+\(cashbackValue)%")
                            .font(.caption)
                            .foregroundColor(.white)
                            .padding(.horizontal, 4)
                            .background(Color(r: 0, g: 183, b: 117))
                            .cornerRadius(8)
                    }
                }
                
                Text(payment.subtitle)
                    .font(.caption)
                    .fontWeight(.light)
                    .tint(Color(r: 122, g: 122, b: 122))
            }
            
            Spacer()
            
            Button(action: activateAction) {
                ZStack {
                    Circle()
                        .stroke(payment.isActive ? Color(r: 255, g: 70, b: 17) : Color.gray, lineWidth: 3)
                        .frame(width: 20, height: 20)
                    if payment.isActive {
                        Circle()
                            .fill(Color(r: 255, g: 70, b: 17))
                            .frame(width: 10, height: 10)
                    }
                }
            }
        }
        .padding()
    }
}
