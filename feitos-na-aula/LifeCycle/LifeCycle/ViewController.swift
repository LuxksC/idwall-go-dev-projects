//
//  ViewController.swift
//  LifeCycle
//
//  Created by Sandra Monteiro de Castro on 24/03/22.
//

import UIKit

class Content: UIView {
    
    lazy var textLabel: UILabel = {
        let label = UILabel()
        label.text = "Hello"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
}

class ViewController: UIViewController {
    
    let content = Content()
    
    override func loadView() {
        super.loadView()
        print("loadView")
        //executado somente uma vez
        //usado para carregamento de dados
        //antes da view carregar
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        //executado somente uma vez
        //usado para carregamento de dados
        //depois que a view carregar
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //um pouco antes da tela aparecer

    }

    override func viewDidAppear(_ animated: Bool) {
        //chamado assim que a view aparece na tela
        //usado para animações
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        //geralmente usado para parar o que foi iniciado no viewDidAppear
        //impedir que animações fiquem rodando infinitamente
        //executado antes da tela desaparecer
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        //chamado sempre que a view some da tela
        //usado quando precisamos trafegar dados ao mudar de tela
    }

}

