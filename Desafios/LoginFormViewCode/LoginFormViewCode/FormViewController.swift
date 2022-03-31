import UIKit

class FormViewController: UIViewController {
    
    // MARK: - Properties Privates
    
    private enum Labels {
        static let email = "Email:"
        static let password = "Senha:"
        static let emailFormatError = "Este email é inválido"
        static let emptyInput = "Campo obrigatório"
        static let loginValidationError = "Email ou senha incorretos"
    }
    
    private enum InputPlaceholders {
        static let email = "pokemon@poke.com"
        static let password = "•••••••••"
    }
    
    private var safeArea: UILayoutGuide!
    
    private var users: [User] = [User(id: UUID(), email: "lucas@gmail.com", password: "lucas"), User(id: UUID(), email: "sandra@hotmail.com", password: "sandra")]
    
    // MARK: - Properties Publics
    lazy var emailLabel: CustomLabel = {
        let label = CustomLabel()
        label.text = Labels.email
        return label
    }()
    
    lazy var emailErrorLabel: CustomErrorLabel = {
        let label = CustomErrorLabel()
        label.text = Labels.emptyInput
        return label
    }()
    
    lazy var passwordLabel: CustomLabel = {
        let label = CustomLabel()
        label.text = Labels.password
        return label
    }()
    
    lazy var passwordErrorLabel: CustomErrorLabel = {
        let label = CustomErrorLabel()
        label.text = Labels.emptyInput
        return label
    }()
    
    lazy var emailInput: CustomTextField = {
        let textField = CustomTextField()
        textField.placeholder = InputPlaceholders.email
        textField.addTarget(self, action: #selector(emailDidChange), for: .editingChanged)
        return textField
    }()
    
    lazy var passwordInput: CustomTextField = {
        let textfield = CustomTextField()
        textfield.placeholder = InputPlaceholders.password
        textfield.addTarget(self, action: #selector(passwordDidChange), for: .editingChanged)
        textfield.isSecureTextEntry = true
        return textfield
    }()
    
    lazy var contentStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 8
        stack.contentMode = .top
        stack.distribution = .equalSpacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var confirmButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("CONFIRM", for: .normal)
        button.setTitleColor(UIColor.systemBlue, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 25
        button.addTarget(self, action: #selector(confirmLogin), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var bottomImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "squirtle")
        image.layer.opacity = 0.2
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    
    // MARK: - Life cicles

    override func viewDidLoad() {
        super.viewDidLoad()
        
        safeArea = view.layoutMarginsGuide
        configView()
        configContentStackView()
        contentStackView.addArrangedSubviews(emailLabel, emailInput, emailErrorLabel, passwordLabel, passwordInput, passwordErrorLabel) // add views to stackview
        configConfirmButton()
        configBottomImage()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        configNavigationTitle()
    }

    // MARK: - Methods Private
    
    private func configView() {
        title = "Welcome Back!"
        
        view.backgroundColor = .systemBlue
    }
    
    private func configContentStackView() {
        view.addSubview(contentStackView)
        
        NSLayoutConstraint.activate([
            contentStackView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 20),
            contentStackView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16),
            contentStackView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16)
        ])
    }
    
    private func configConfirmButton() {
        view.addSubview(confirmButton)
        
        NSLayoutConstraint.activate([
            confirmButton.heightAnchor.constraint(equalToConstant: 55),
            confirmButton.topAnchor.constraint(equalTo: contentStackView.bottomAnchor, constant: 40),
            confirmButton.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16),
            confirmButton.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16)
        ])
    }
    
    private func configBottomImage() {
        view.addSubview(bottomImageView)
        
        NSLayoutConstraint.activate([
            bottomImageView.heightAnchor.constraint(equalToConstant: 284),
            bottomImageView.widthAnchor.constraint(equalToConstant: 284),
            bottomImageView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            bottomImageView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -12)
        ])
    }
    
    private func configNavigationTitle() {
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let appearance = UINavigationBarAppearance()
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
    }
    
    @objc
    private func emailDidChange() {
        emailErrorLabel.isHidden = true
    }
    
    @objc
    private func passwordDidChange() {
        passwordErrorLabel.isHidden = true
    }
    
    @objc
    private func confirmLogin() {
        
        if let email = emailInput.text,
           let password = passwordInput.text {
            
            //Verifica se algum dos campos está vazio
            if (email == "" || password == "") {
                if password == ""{
                    passwordErrorLabel.isHidden = false
                }
                if email == "" {
                    emailErrorLabel.isHidden = false
                }
                return
            }
            
            //Verifica se o email é válido
            let isValidEmail = email.isValidEmailAddress(email)
            
            if !isValidEmail {
                emailErrorLabel.text = Labels.emailFormatError
                emailErrorLabel.isHidden = false
                return
            }
            
            //Verifica se email e senha estão no banco de dados
            for user in users {
                if (email == user.email && password == user.password) {
                    let alert = UIAlertController(title: "Successful Login", message: "User data matches database", preferredStyle: .alert)
                    
                    alert.addAction(UIAlertAction(title: "Confirm", style: .default))
                    
                    present(alert, animated: true)
                    
                    return
                }
            }
            
            //Caso email e senha não estejam no banco de dados
            let alert = UIAlertController(title: "Login Failed", message: "User data does not matches database", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Retry", style: .destructive))
            
            present(alert, animated: true)
            
            return
        }
        
    }

}

