import SwiftUI

struct OrderTotalView: View {
    let imageName: String
    let title: String
    let description: String
    let mainButtonTitle: String
    let mainButtonAction: () -> Void
    let optionalButtonTitle: String?
    let optionalButtonAction: (() -> Void)?
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            VStack(spacing: 10) {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                
                Text(title)
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                
                Text(description)
                    .font(.caption)
                    .multilineTextAlignment(.center)
                    .lineSpacing(5)
                    .padding(.init(top: 5, leading: 20, bottom: 5, trailing: 20))
                
                CustomButton(title: mainButtonTitle, backgroundColor: Color(r: 255, g: 70, b: 17), textColor: Color(r: 255, g: 255, b: 255)) {
                    mainButtonAction()
                }
                .padding(.init(top: 15, leading: 30, bottom: 0, trailing: 30))
                
                if let optionalButtonTitle {
                    CustomButton(title: optionalButtonTitle, backgroundColor: Color(r: 255, g: 255, b: 255), textColor: Color(r: 255, g: 70, b: 17)) {
                        optionalButtonAction?()
                    }
                    .padding(.init(top: 0, leading: 30, bottom: 5, trailing: 30))
                }
            }
            .padding()
            .navigationBarItems(leading: Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "xmark")
                    .tint(.black)
            })
        }
    }
}

#Preview {
    OrderTotalView(
        imageName: "Bag Success",
        title: "Спасибо за заказ!",
        description: "Ваш заказ успешно оформлен. Вы можете отслеживать его статус в личном кабинете.",
        mainButtonTitle: "Вернуться на главную",
        mainButtonAction: {
            print("Главная кнопка нажата")
        },
        optionalButtonTitle: "Посмотреть детали",
        optionalButtonAction: {
            print("Опциональная кнопка нажата")
        }
    )
}
