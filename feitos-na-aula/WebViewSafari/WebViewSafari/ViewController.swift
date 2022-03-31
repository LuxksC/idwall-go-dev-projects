import UIKit
import SafariServices //controlar serviços do Safari

class ViewController: UIViewController {
    
    lazy var button: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Call Safari", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = .orange
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(callSafari), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemIndigo
        
        setupButton()
    }

    private func setupButton() {
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.heightAnchor.constraint(equalToConstant: 45),
            button.widthAnchor.constraint(equalToConstant: view.layer.frame.width / 2)
        ])
    }
    
    @objc
    private func callSafari() {
        
        if let url = URL(string: "https://www.apple.com") {
            
            let config = SFSafariViewController.Configuration()
            
            config.entersReaderIfAvailable = true
            
            let viewController = SFSafariViewController(url: url, configuration: config)
            
            viewController.delegate = self // forma de controlar as ações dentro do safari
            
            viewController.preferredControlTintColor = .black // muda a tint collor dos items da navigation no Safari
            
            viewController.dismissButtonStyle = .close //modifica o estilo do botão de fechamento do Safari e volta pro app
            
            viewController.preferredBarTintColor = .red // background da navigation bar
            
            present(viewController, animated: true)
        }
    }

}

extension ViewController: SFSafariViewControllerDelegate {
    
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        controller.dismiss(animated: true) {
            print("Completou o Dismiss aqui Zé")
        }
    }
    
    
    //função que roda quando a view carrega
    func safariViewController(_ controller: SFSafariViewController, didCompleteInitialLoad didLoadSuccessfully: Bool) {
        print("Deu bom Zé")
    }
}

