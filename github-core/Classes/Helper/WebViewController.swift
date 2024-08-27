import UIKit
import WebKit

public class WebViewController: UIViewController {

    private var webView: WKWebView?
    private var route: String = ""

    public override func viewDidLoad() {
        super.viewDidLoad()
        
        webView = WKWebView(frame: self.view.frame)
        webView?.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        guard let webView = webView else { return }
        
        self.view.addSubview(webView)
        
        // Carregar uma URL
        if let url = URL(string: route) {
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }
    
    public init(with route: String) {
        super.init(nibName: nil, bundle: nil)
        self.route = route
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
