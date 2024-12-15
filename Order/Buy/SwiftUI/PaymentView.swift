import SwiftUI

struct PaymentView: View {
    let payment: PaymentModel
    
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
                
                    if payment.discount != nil {
                        Text("-\(payment.discount!)%")
                            .font(.caption)
                            .foregroundColor(.white)
                            .padding(.horizontal, 4)
                            .background(.black)
                            .cornerRadius(8)
                    }
                    
                    if payment.cashback != nil {
                        Text("+\(payment.discount!)%")
                            .font(.caption)
                            .foregroundColor(.white)
                            .padding(.horizontal, 4)
                            .background(.green)
                            .cornerRadius(8)
                    }
                }
                
                Text(payment.subtitle)
                    .font(.caption)
                    .fontWeight(.light)
                    .tint(Color(r: 122, g: 122, b: 122))
            }
            
            Spacer()
            ToggleButton()
                .padding(.top, 8)
        }
        .padding()
    }
    
}

struct ToggleButton: View {
    @State private var isOn: Bool = false

    var body: some View {
        VStack(spacing: 40) {
            Button(action: {
                isOn.toggle()
            }) {
                ZStack {
                    Circle()
                        .stroke(isOn ? Color(r: 255, g: 70, b: 17) : Color.gray, lineWidth: 3)
                        .frame(width: 20, height: 20)
                    if isOn {
                        Circle()
                            .fill(Color(r: 255, g: 70, b: 17))
                            .frame(width: 10, height: 10)
                    }
                }
            }
            .buttonStyle(PlainButtonStyle())
        }
    }
}
