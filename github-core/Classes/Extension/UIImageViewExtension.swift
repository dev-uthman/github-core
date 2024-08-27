import UIKit

public extension UIImageView {
    func roundedLoadImage(from urlStr: String) {
        if let url = URL(string: urlStr) {
            URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
                if let error = error {
                    print("Erro ao carregar a imagem: \(error)")
                    return
                }
                
                guard let data = data, let image = UIImage(data: data) else {
                    print("Dados inválidos ou não é possível converter dados em UIImage.")
                    return
                }
                DispatchQueue.main.async {
                    self?.layer.cornerRadius = (self?.frame.size.width ?? 0) / 2
                    self?.layer.borderWidth = 2
                    self?.layer.borderColor = UIColor.black.cgColor
                    self?.image = image
                }
            }.resume()
        }
    }
}
