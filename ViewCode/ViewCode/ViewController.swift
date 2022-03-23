//
//  ViewController.swift
//  ViewCode
//
//  Created by Sandra Monteiro de Castro on 22/03/22.
//

import UIKit

class ViewController: UIViewController {
    /*
    var button: UIButton = UIButton() // só é possível fazer manipulação desse button dentro de uma função ou propriedade
     */
    
    var safeArea: UILayoutGuide!
    
    lazy var iconImageView: UIImageView = { //manipulação das propriedades usando closure
        let icon = UIImageView()
        
        icon.image = UIImage(systemName: "airplane") //nome do ícone na biblioteca
        icon.translatesAutoresizingMaskIntoConstraints = false // define se a mascara de autolayout deve ser utilizado, caso seja true é necessário usar calculos matematicos para posicionamento
        
        return icon
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        
        //ESTILIZAÇÃO DO LABEL
        label.textColor = .systemBlue
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 13)
        label.text = "Desscription for a long text that is not a Lorem that is bigger than onnnnneee line"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
        //BUTTON STYLE
        button.setTitle("Button View", for: UIControl.State.normal)
        button.frame = CGRect(x: 0, y: 0, width: 130, height: 45)
        button.backgroundColor = .systemRed
        
        //ADDING BUTTON ON VIEW
        view.addSubview(button)
        */
        
        //DEFINIÇÃO DE UMA SAFE AREA PARA O APP
        safeArea = view.layoutMarginsGuide //iremos usar essa referencia em vez de usar a view
        
        //ADDING IMAGE AND LABEL ON VIEW
        view.addSubview(iconImageView)
        view.addSubview(titleLabel)
        
        //SET .isActive = true for everything inside it
        NSLayoutConstraint.activate([
            //POSITIONING IMAGE
            iconImageView.topAnchor.constraint(equalTo: safeArea.topAnchor /*referencia de posicionamento*/, constant: 10),
            iconImageView.heightAnchor.constraint(equalToConstant: 80),
            iconImageView.widthAnchor.constraint(equalToConstant: 80),
            iconImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        
        ])
        
        
        
        //POSITIONING IMAGE
        titleLabel.topAnchor.constraint(equalTo: iconImageView.bottomAnchor, constant: 20).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        
        title = "View Controller"
        
        view.backgroundColor = .white
    }


}

