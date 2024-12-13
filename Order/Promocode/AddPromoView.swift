import SwiftUI

struct AddPromoUIKitWrapper: UIViewControllerRepresentable {
    func updateUIViewController(_ uiViewController: AddPromoViewController, context: Context) {
        
    }
    
    func makeUIViewController(context: Context) -> AddPromoViewController {
        return AddPromoViewController()
    }
}

struct AddPromoView: View {
    var body: some View {
        AddPromoUIKitWrapper()
            .edgesIgnoringSafeArea(.all)
            .navigationBarTitle("Применить промокод", displayMode: .inline)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: BackButton())
    }
}

struct BackButton: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "chevron.left")
                .foregroundColor(Color(red: 1, green: 70 / 255, blue: 17 / 255))
        }
    }
}
