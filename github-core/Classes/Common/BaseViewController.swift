import UIKit

open class BaseViewController<View: UIView>: UIViewController {
    
    var loadingView: UIView?
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        debugPrint("%%%%\(self.typeName)%%%%")
    }
    
    public var customView: View {
        return view as! View
    }
    
    public init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    public required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func loadView() {
        view = View()
    }
    
    @available(iOS 13.0, *)
    public func showLoading() {
        guard loadingView == nil else { return }
        
        // Cria a view que vai cobrir toda a tela
        let loadingView = UIView(frame: self.view.bounds)
        loadingView.backgroundColor = UIColor(white: 0, alpha: 0.5)
        loadingView.translatesAutoresizingMaskIntoConstraints = false
        
        // Cria o indicador de atividade
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.center = loadingView.center
        activityIndicator.startAnimating()
        
        // Adiciona o indicador à view
        loadingView.addSubview(activityIndicator)
        
        // Adiciona a view de loading à view principal
        self.view.addSubview(loadingView)
        self.loadingView = loadingView
        loadingView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loadingView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    public func hideLoading() {
        // Remove a view de loading da tela
        loadingView?.removeFromSuperview()
        loadingView = nil
    }
}

extension BaseViewController: NameDescribable {}

private protocol NameDescribable {
    var typeName: String { get }
}

private extension NameDescribable {
    var typeName: String {
        return String(describing: type(of: self))
    }
}
