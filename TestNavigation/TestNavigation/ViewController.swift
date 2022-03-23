//
//  ViewController.swift
//  TestNavigation
//
//  Created by Sandra Monteiro de Castro on 22/03/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "app 1"
        view.backgroundColor = .orange
    }

    //maneira de fazer deeplink
    @IBAction func getViewController() {
        
        let customUrl = "NavigationScheme://" //padrão de nomeclatura
        // NomeDoScheme/value/...
        
        
        if let url = URL(string: customUrl) { //validação de url
            
            if UIApplication.shared.canOpenURL(url) { // verificação se é possível abrir url
                UIApplication.shared.open(url) //abrir app 2, usando o NavegationScheme como referencia
            }
        }
        
    }

}

