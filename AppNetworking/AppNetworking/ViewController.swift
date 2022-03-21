//
//  ViewController.swift
//  AppNetworking
//
//  Created by Sandra Monteiro de Castro on 18/03/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var loading: UIActivityIndicatorView!
    
    //lazy = variável só é instanciada quando for utilizada
    lazy var users = [User]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        delegates()
        getUsers()
        showLoading()
    }
    
    private func delegates() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func getUsers() {
        Service.shared.getUsers { result in
            
            switch result {
            case .success(let res):
                self.users = res
            case.failure(let error):
                print(error)
            }
            
            self.hideLoading()
        }
    }
    
    private func showLoading() {
        loading.startAnimating()
        loading.isHidden = false
    }
    
    private func hideLoading() {
        DispatchQueue.main.async{
            self.loading.stopAnimating()
            self.loading.isHidden = true
        }
    }
}

extension ViewController: UITableViewDelegate {}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //lembrar de adicionar o identifier
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let user = users[indexPath.row]
        
        cell.textLabel?.text = user.name
        cell.detailTextLabel?.text = user.email
        
        return cell
    }
    
    
}
//    Button
//    @IBAction func getUsers() {
//        Service.shared.getUsers { result in
//            switch result {
//            case .success(let res):
//                print(res)
//            case.failure(let error):
//                print(error)
//            }
//        }
//    }

//Uso do Activity Indicator



