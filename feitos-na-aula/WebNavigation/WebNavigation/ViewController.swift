import UIKit
import WebKit // permite usar o WKWebKit, versão atual do UIWebView

class ViewController: UIViewController {
    
    lazy var webview: WKWebView = {
        let webConfiguration = WKWebViewConfiguration()
        let web = WKWebView(frame: .zero, configuration: webConfiguration)
        web.navigationDelegate = self
        web.translatesAutoresizingMaskIntoConstraints = false
        return web
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .orange
        
        configUI()
        setupWebView()
        setupNavBar()
        
        webview.
    }

    private func setupWebView() { //vai receber uma propriedade string e chamar o load
        let url = URL(string: "https://www.apple.com")
        let request = URLRequest(url: url!)
        
        //pay attention to what types of things it can load
        webview.load(request)
    }
    
    private func configUI() {
        view.addSubview(webview)
        
        NSLayoutConstraint.activate([
            webview.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            webview.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            webview.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            webview.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    private func setupNavBar(){
        
        //estilização da ultima aula -------------
        
        let fowardBarItem = UIBarButtonItem(image: UIImage.init(systemName: "arrow.right"), style: .plain, target: self, action: #selector(fowardAction))
        
        let backBarItem = UIBarButtonItem(image: UIImage.init(systemName: "arrow.backward"), style: .plain, target: self, action: #selector(backAction))
        
        let reloadBarItem = UIBarButtonItem(image: UIImage.init(systemName: "arrow.counterclockwise"), style: .plain, target: self, action: #selector(reloadAction))
        
        
        navigationItem.leftBarButtonItem = reloadBarItem
        navigationItem.rightBarButtonItems = [fowardBarItem, backBarItem]
        
    }

}

extension ViewController {
    @objc
    private func fowardAction() {
        // verificação de pode ir pra frente
        if webview.canGoForward {
            webview.goForward()
        }
        
    }
    
    @objc
    private func backAction() {
        // verificação de poder voltar
        if webview.canGoBack {
            webview.goBack()
        }
    }
    
    @objc
    private func reloadAction() {
        webview.reload()
    }
}

extension ViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        print("Iniciando o site ...")
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("Terminou de carregar a página!!")
    }
    
    // FALHA NA INICIALIZAÇÃO DA PAGINA
//    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
//        <#code#>
//    }
    
}

/*Para manter o usuário dentro do app, recomenda-se utilizar a lib em vez do deep link. Caso você queira que o usuário saia do app, você pode utilizar o deep link*/
