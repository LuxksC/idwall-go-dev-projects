//
//  ViewController.swift
//  ViewCode
//
//  Created by Douglas Nunes on 22/03/22.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Properties Privates
    
    private enum Defaults {
        
        static let titleInfo = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries"
        static let titleButton = "Call View"
        static let descriptionInfo = "Center Label"
        
        static let titleView = "View Code"
    }
    
    private var safeArea: UILayoutGuide!
    
    
    // MARK: - Properties Publics
    
    lazy var iconImageView: UIImageView = {
        let icon = UIImageView()
        icon.image = UIImage(systemName: "airplane")
        icon.translatesAutoresizingMaskIntoConstraints = false
        return icon
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .blue
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 13)
        label.backgroundColor = .orange
        label.text = Defaults.titleInfo
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var callButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle(Defaults.titleButton, for: .normal)
        button.backgroundColor = .orange
        button.setTitleColor(UIColor.white, for: .normal)
        button.addTarget(self, action: #selector(getView), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var content: UIView = {
        let view = UIView()
        view.backgroundColor = .systemIndigo
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .grayViewCode
        label.text = Defaults.descriptionInfo
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    @objc func getView() {
        print("Cliquei aqui")
    }
    
    // MARK: - Life cicles

    override func viewDidLoad() {
        super.viewDidLoad()
        
        safeArea = view.layoutMarginsGuide
        configureView()
        addSubviews()
        configureIconImageView()
        configureTitleLabel()
        configureCallButton()
    }

    
    // MARK: - Methods Private
    
    private func addSubviews() {
        view.addSubviews(iconImageView, callButton, titleLabel, content)
        
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
    
    private func configureTitleLabel() {
        titleLabel.topAnchor.constraint(equalTo: iconImageView.bottomAnchor, constant: 20).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Metrics.Margin.default).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Metrics.Margin.default).isActive = true
    }
    
    private func configureCallButton() {
        NSLayoutConstraint.activate([
        
            callButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            callButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Metrics.Margin.default),
            callButton.heightAnchor.constraint(equalToConstant: Metrics.Margin.input),
            callButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Metrics.Margin.default)
        ])
    }
    
    private func configureContentView() {
        NSLayoutConstraint.activate([
            content.topAnchor.constraint(equalTo: callButton.bottomAnchor, constant: 20),
            content.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Metrics.Margin.default),
            content.heightAnchor.constraint(equalToConstant: 200),
            content.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Metrics.Margin.default)
        ])
        
    }
    
    private func configureDescriptionLabel() {
        NSLayoutConstraint.activate([
            descriptionLabel.centerXAnchor.constraint(equalTo: content.centerXAnchor),
            descriptionLabel.centerYAnchor.constraint(equalTo: content.centerYAnchor)
        ])
    }
    
    private func configureView() {
        title = Defaults.titleView
        
        view.backgroundColor = .white
    }

}

