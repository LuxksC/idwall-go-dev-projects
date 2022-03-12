//
//  ViewController.swift
//  calcularIMC
//
//  Created by Sandra Monteiro de Castro on 12/03/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var pesoTextField: UITextField!
    @IBOutlet weak var alturaTextField: UITextField!
    @IBOutlet weak var resultadoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        resultadoLabel.text = ""
        
        
    }
    
    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

    @IBAction func handleCalcular(_ sender: UIButton) {
        view.endEditing(true)
        
        let strPeso = pesoTextField.text?.replacingOccurrences(of: ",", with: ".")
        let strAltura = alturaTextField.text?.replacingOccurrences(of: ",", with: ".")
        
        guard let peso = Float(strPeso!),
              let altura=Float(strAltura!) else {
                  resultadoLabel.text = "Valores inválidos"
                  resultadoLabel.isHidden = false
                  return
              }
        let imc = peso/pow(altura, 2)
        
        switch imc {
        case 0..<18.5:
            resultadoLabel.text = "Você está abaixo do seu peso ideal 🙃"
        case 18.5..<25:
            resultadoLabel.text = "Você está no seu peso ideal ✅"
        case 25..<30:
            resultadoLabel.text = "Você está com sobrepeso 🤐"
        case 30..<35:
            resultadoLabel.text = "Você está com obesidade grau 1 🤐🤐"
        case 35..<40:
            resultadoLabel.text = "Você está com obesidade grau 2 🤐🤐🤐"
        case 40...:
            resultadoLabel.text = "Você está com obesidade grau 3 ☠️"
        default:
            resultadoLabel.text = "Valores inválidos"
        }
        
        
        resultadoLabel.isHidden = false
    }
    
}

