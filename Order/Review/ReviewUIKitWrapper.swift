import SwiftUI

struct ReviewUIKitWrapper: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> ReviewListViewController {
        return ReviewListViewController()
    }
    
    func updateUIViewController(_ uiViewController: ReviewListViewController, context: Context) {
        
    }
}

struct ReviewView: View {
    var body: some View {
        ReviewUIKitWrapper()
            .edgesIgnoringSafeArea(.all)
            .navigationBarTitle("Напишите отзыв", displayMode: .inline)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: BackButton())
    }
}


