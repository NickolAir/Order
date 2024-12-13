import SwiftUI

struct MainScreenView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("ORDER")
                    .font(.largeTitle)
                    .fontWeight(.medium)
                    .padding()
                VStack {
                    NavigationLink(destination: AddPromoView()) {
                        CustomButton(title: "Ввод промокода",
                                     backgroundColor: Color(r: 255, g: 70, b: 17),
                                     textColor: .white)
                    }
                    NavigationLink(destination: ReviewView()) {
                        CustomButton(title: "Отзыв", backgroundColor: Color(r: 255, g: 70, b: 17), textColor: Color(r: 255, g: 255, b: 255))
                    }
                    NavigationLink(destination: CancelOrderView()) {
                        CustomButton(title: "Отмена заказа", backgroundColor: Color(r: 255, g: 70, b: 17), textColor: Color(r: 255, g: 255, b: 255))
                    }
                    CustomButton(title: "Заказ", backgroundColor: Color(r: 255, g: 70, b: 17), textColor: Color(r: 255, g: 255, b: 255))
                    {
                        
                    }
                }
                .padding()
            }
        }
    }
}

#Preview {
    MainScreenView()
}
