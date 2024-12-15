import SwiftUI
struct PromoCodeView: View {
    @Binding var promoCode: PromoCode
    let activateAction: () -> ()
    @EnvironmentObject var viewModel: OrderViewModel
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color(r: 246, g: 246, b: 246))
                .cornerRadius(12)
            
            HStack {
                Circle()
                    .fill(Color.white)
                    .frame(width: 16, height: 16)
                    .offset(x: -8)
                
                Spacer()
                
                Circle()
                    .fill(Color.white)
                    .frame(width: 16, height: 16)
                    .offset(x: 8)
            }
            
            HStack {
                VStack(alignment: .leading) {
                    HStack {
                        Text(promoCode.code)
                            .font(.system(size: 16))
                        
                        Text("-\(promoCode.discount)%")
                            .padding(.horizontal, 6)
                            .padding(.vertical, 2)
                            .background(Color(r: 0, g: 183, b: 117))
                            .foregroundStyle(.white)
                            .cornerRadius(32)
                            .font(.system(size: 12))
                        
                        Button(action: {
                            
                        }) {
                            Image("infoButton")
                        }
                    }
                    
                    Text("По \(promoCode.expirationDate)")
                        .font(.caption)
                        .foregroundColor(.gray)
                    
                    if let description = promoCode.description {
                        Text(description)
                            .font(.caption2)
                            .foregroundColor(.gray)
                            .padding(.top, 1)
                    }
                }
                
                Spacer()
                
                Toggle("", isOn: $promoCode.isActive)
                    .toggleStyle(SwitchToggleStyle(tint: Color(r: 255, g: 70, b: 17)))
                    .onChange(of: promoCode.isActive) { newValue in
                        if newValue {
                            activateAction()
                        }
                        viewModel.calculate()
                    }
                    .padding(.horizontal, 12)
            }
            .padding(.vertical, 12)
            .padding(.leading, 12)
        }
    }
}
