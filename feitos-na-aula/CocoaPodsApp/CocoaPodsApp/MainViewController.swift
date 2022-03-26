//
//  MainViewController.swift
//  CocoaPodsApp
//
//  Created by Sandra Monteiro de Castro on 21/03/22.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    lazy var users = [User]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegates()
        register()
        getUsers()
        
    }
    
    private func delegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func register() {
        let nib = UINib(nibName: CustomTableViewCell.identifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: CustomTableViewCell.identifier)
    }
    
    private func getUsers() {
        DougService.shared.getUsers { result in
            
            switch result {
            case .success(let res):
                self.users = res
            case.failure(let error):
                print(error)
            }
            
            //self.hideLoading()
        }
    }
}

extension MainViewController: UITableViewDelegate {}

extension MainViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as? CustomTableViewCell else { return UITableViewCell() }
        
        let user = users[indexPath.row]
        
        cell.setup(title: user.name, companyName: user.company.name, imageUrl: user.photo)
        
        return cell
    }
    
    
}
