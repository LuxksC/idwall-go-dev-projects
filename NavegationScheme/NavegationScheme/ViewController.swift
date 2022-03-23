//
//  ViewController.swift
//  NavegationScheme
//
//  Created by Sandra Monteiro de Castro on 22/03/22.
//

// doc schemes feature 
import UIKit
import MessageUI

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "app 2"
        
        view.backgroundColor = .systemIndigo
    }

    @IBAction func getFacebook() {
        
        let schemes = "fb://"
        
        if let url = URL(string: schemes) { // verificação de url válida
            
            if UIApplication.shared.canOpenURL(url) { //validação se o app está instalado
                UIApplication.shared.open(url) //abre o facebook
            }
        }
        
    }
    
    @IBAction func getWhatsapp() {
        
        let schemes = "whatsapp://"
        
        if let url = URL(string: schemes) { // verificação de url válida
            
            if UIApplication.shared.canOpenURL(url) { //validação se o app está instalado
                UIApplication.shared.open(url) //abre o facebook
            }
        }
        
    }
    
    @IBAction func getNumberPhone() {
        
        let schemes = "tel://+55(21)995414050"
        
        if let url = URL(string: schemes) { // verificação de url válida
            
            if UIApplication.shared.canOpenURL(url) { //validação se o app está instalado
                UIApplication.shared.open(url) //abre o facebook
            }
        }
    }
    
    @IBAction func getSMS() {
        
        let schemes = "sms://+55(21)995414050"
        
        if let url = URL(string: schemes) { // verificação de url válida
            
            if UIApplication.shared.canOpenURL(url) { //validação se o app está instalado
                UIApplication.shared.open(url) //abre o facebook
            }
        }
    }
    
    @IBAction func getGmail() {
        
        let recipeEmail = "lucas_08_castro@poli.ufrj.br"
        let subject = "Title Subject"
        let body = "Email Body"
        
        
        createEmail(to: recipeEmail, subject: subject, body: body)
    }
    
    private func createEmail(to: String, subject: String, body: String) {
        
        var schemes = "" //variável criada vazia pq precisamos validar as propriedades
        
        //no context do gmail o deep link precisa ser formatado, isso será feito com as funções de encoding abaixo
        if let subjectEncoded = subject.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
           let bodyEncoded = body.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
            
            schemes = "googlegmail://co?to=\(to)&subject=\(subjectEncoded)&body=\(bodyEncoded)"
            
        }
        
        if let url = URL(string: schemes) {
            if UIApplication.shared.canOpenURL(url) { //validação se o app está instalado
                UIApplication.shared.open(url) //abre o facebook
            }
        }
        
    }
    
    @IBAction func getEmail() { //utilização do email padrao do iphone
        
        let recipeEmail = "lucas_08_castro@poli.ufrj.br"
        let subject = "Title Subject"
        let body = "Email Body"
        
        if MFMailComposeViewController.canSendMail() { //validação se é possível enviar o email
            
            let mail = MFMailComposeViewController()
            
            mail.mailComposeDelegate = self //protocolo para controlar o que vai ser feito
            mail.setCcRecipients([recipeEmail])
            mail.setSubject(subject)
            mail.setMessageBody(body, isHTML: false)
            
            present(mail, animated: true)
        }
        
    }

}

//extensão para comunicação com email nativo do iphone
extension ViewController: MFMailComposeViewControllerDelegate {
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        
        switch result {
            
        case .cancelled:
            print("cancelled")
        case .saved:
            print("saved")
        case .sent:
            print("sent")
        case .failed:
            print("failed")
        @unknown default:
            print("default")
        }
        
    }
}
