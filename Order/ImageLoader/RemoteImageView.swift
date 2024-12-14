import SwiftUI

struct RemoteImageView: View {
    @StateObject private var loader = DownloadService()
    let url: URL?

    var body: some View {
        ZStack {
            if let image = loader.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 100, maxHeight: 100)
                    .cornerRadius(8)
            } else {
                ProgressView()
                    .frame(width: 100, height: 100)
                    .onAppear {
                        if let url = url {
                            loader.load(from: url)
                        }
                    }
            }
        }
    }
}
