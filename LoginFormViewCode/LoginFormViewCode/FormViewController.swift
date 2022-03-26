//
//  ViewController.swift
//  LoginFormViewCode
//
//  Created by Sandra Monteiro de Castro on 23/03/22.
//

import UIKit

class FormViewController: UIViewController {
    
    // MARK: - Properties Privates
    
    private enum Labels {
        static let email = "Email:"
        static let password = "Senha:"
    }
    
    private enum InputPlaceholders {
        static let email = "pokemon@poke.com"
        static let senha = "•••••••••"
    }
    
    private var safeArea: UILayoutGuide!
    
    // MARK: - Properties Publics
    lazy var emaiLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemBackground
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = Labels.email
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var passwordLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemBackground
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = Labels.password
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var emailInput: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    
    
    // MARK: - Life cicles

    override func viewDidLoad() {
        super.viewDidLoad()
        
        safeArea = view.layoutMarginsGuide
        configureView()
        
    }

    // MARK: - Methods Private
    
    private func configureView() {
        title = "Login"
        
        view.backgroundColor = .systemBlue
    }
    
    private func addSubviews() {
        view.addSubviews(emaiLabel, emailInput, passwordLabel)
        
        content.addSubview(descriptionLabel)
    }
    
    private func configureIconImageView() {
        NSLayoutConstraint.activate([
            iconImageView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 10),
            iconImageView.heightAnchor.constraint(equalToConstant: 80),
            iconImageView.widthAnchor.constraint(equalToConstant: 80),
            iconImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

}

