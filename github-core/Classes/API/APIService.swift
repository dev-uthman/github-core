import Foundation
import RxSwift

// MARK: Class
open class APIService {
    
    // MARK: Public variabels
    public static let shared = APIService()
    
    // MARK: Private initializer
    private init() {}
    
    // MARK: Private variabels
    private let baseURL = URL(string: "https://api.github.com/")!
    
    // MARK: Public methods
    
    public func fetchData<T: Decodable>(from endpoint: String, type: T.Type, page: Int? = nil) -> Observable<T> {
        var url:URL = baseURL.appendingPathComponent(endpoint)
        
        if let page = page {
            var components = URLComponents(url: url, resolvingAgainstBaseURL: false)
            components?.queryItems = [
                URLQueryItem(name: "page", value: page.description)
            ]
            url = components?.url ?? baseURL.appendingPathComponent(endpoint)
        }
        debugPrint("URL.: \(url)")
        
        return Observable.create { observer in
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    observer.onError(error)
                    return
                }
                
                guard let data = data else {
                    observer.onError(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Nenhum dado recebido"]))
                    return
                }
                
                do {
                    let decodedObject = try JSONDecoder().decode(T.self, from: data)
                    observer.onNext(decodedObject)
                    observer.onCompleted()
                } catch let decodingError {
                    observer.onError(decodingError)
                }
            }
            
            task.resume()
            
            return Disposables.create {
                task.cancel()
            }
        }
    }
}
