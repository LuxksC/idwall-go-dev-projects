import UIKit

class ContactsViewController: UIViewController {
    
    // MARK: - Properties Public
    
    lazy var closeButton: UIButton = {
        let button = UIButton(type: .close)
        button.tintColor = .white
        button.addTarget(self, action: #selector(closeModal), for: .touchUpInside) //addTarget -> cria ação de butão
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    @objc
    func closeModal() {
        dismiss(animated: true) {
            print("closeModal Closure working")
        }
    }
    
    // MARK: - Life cicles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configView()
        configCloseButton()
    }

    // MARK: - Methods Private
    
    private func configView() {
        title = "Contacts"
        view.backgroundColor = .systemGray
    }
    
    private func configCloseButton() {
        view.addSubview(closeButton)
        
        NSLayoutConstraint.activate([
            closeButton.heightAnchor.constraint(equalToConstant: 23),
            closeButton.widthAnchor.constraint(equalToConstant: 23),
            closeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 12),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12)
        ])
    }
}

