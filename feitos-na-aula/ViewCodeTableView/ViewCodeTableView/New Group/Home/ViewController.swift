//
//  ViewController.swift
//  ViewCodeTableView
//
//  Created by Sandra Monteiro de Castro on 24/03/22.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var tableview: UITableView = {
        let table = UITableView(frame: .zero, style: .plain)
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()

    override func viewWillAppear(_ animated: Bool) {
        //deixa os títulos Grandes
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let appearence = UINavigationBarAppearance()
        
        appearence.backgroundColor = .systemPurple
        appearence.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearence.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.standardAppearance = appearence
        navigationController?.navigationBar.scrollEdgeAppearance = appearence
       
        // butão de voltar da navegation view
        navigationController?.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        //passando imagem para o butão de voltar da navigation
        let addButton = UIBarButtonItem(image: UIImage.init(systemName: "house"), style: .plain, target: self, action: #selector(callSecondView))
        
        navigationItem.rightBarButtonItems = [addButton]
    }
    
    //
    @objc
    func callSecondView() {
        let secondViewController = SecondViewController()
        
        //alterando variável publica de outra class
        secondViewController.idProduct = "handomId#19387402"
        
        navigationController?.present(secondViewController, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        title = "View Controller"
        view.backgroundColor = .systemOrange
        
        view.addSubview(tableview)
        
        tableview.delegate = self
        tableview.dataSource = self
        
        NSLayoutConstraint.activate([
            tableview.topAnchor.constraint(equalTo: view.topAnchor),
            tableview.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableview.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableview.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        tableview.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
    }


}


extension ViewController: UITableViewDelegate {
    
    //navegação de uma tela pra outra
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let thirdViewController = ThirdViewController()
        
        if let _ = navigationController { navigationController?.pushViewController(thirdViewController, animated: true)} else {
            present(thirdViewController, animated: true)
        }
        
        //validação
        
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableview.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as? CustomTableViewCell else { return UITableViewCell() }
        
        return cell
    }
    
    
}
