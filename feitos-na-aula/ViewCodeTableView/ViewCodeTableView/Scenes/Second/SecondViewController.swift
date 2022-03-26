import UIKit

class SecondViewController: UIViewController {
    
    // MARK: - Properties Public
    
    lazy var closeButton: UIButton = {
        let button = UIButton(type: .close)
        button.tintColor = .red
        button.addTarget(self, action: #selector(closeModal), for: .touchUpInside) //addTarget -> cria ação de butão
        //button.addAction(<#T##action: UIAction##UIAction#>, for: <#T##UIControl.Event#>) -> Faz a mesma coisa que o addTarget porem não é necessário passar um #selector e só da suporte para IOS 14 pra cima
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc
    func closeModal() {
        dismiss(animated: true) {
            print("cabooo")
        }
    }
    
    public var idProduct: String? //botando a variável como optional, deixa desnecessário inicializar ela
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let idProduct = idProduct {
            print(idProduct)
        }
        
        view.backgroundColor = .orange
        
        view.addSubview(closeButton)
        
        NSLayoutConstraint.activate([
            closeButton.heightAnchor.constraint(equalToConstant: 30),
            closeButton.widthAnchor.constraint(equalToConstant: 30),
            closeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 15),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15)
        ])
    }
    
}
