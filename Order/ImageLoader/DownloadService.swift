import SwiftUI

class DownloadService: ObservableObject {
    @Published var image: UIImage? = nil
    
    private static let imageCache = NSCache<NSURL, UIImage>()
    
    func load(from url: URL) {
        if let cachedImage = Self.imageCache.object(forKey: url as NSURL) {
            self.image = cachedImage
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, let loadedImage = UIImage(data: data) else {
                print("Ошибка загрузки изображения: \(error?.localizedDescription ?? "Неизвестная ошибка")")
                return
            }

            Self.imageCache.setObject(loadedImage, forKey: url as NSURL)

            DispatchQueue.main.async {
                self.image = loadedImage
            }
        }.resume()
    }
}
