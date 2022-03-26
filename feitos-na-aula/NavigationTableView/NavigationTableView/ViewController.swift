//
//  ViewController.swift
//  NavigationTableView
//
//  Created by Sandra Monteiro de Castro on 15/03/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let cars: [Cars] = [Cars(image: "bmw", name: "BMW Série 3 Sedã"),
                    Cars(image: "ferrari", name: "Ferrari"),
                    Cars(image: "camaro", name: "Chevrolet Camaro") ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegates()
        register()
        
        
    }
    
    private func delegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func register() {
        let nib = UINib(nibName: CustomTableViewCell.identifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: CustomTableViewCell.identifier)
    }

}

extension ViewController: UITableViewDelegate {
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cars.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->  UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as? CustomTableViewCell else { return UITableViewCell() }
        
        let car = cars[indexPath.row]
        
        cell.setup(title: car.name, image: car.image)
        
        return cell
    }
    
    //UTILIZAR SEARCH CONTROL
    //ORDENAÇÃO DA LIST PELA API, PROCURAR PARAMETER ORDER NA API
    //rEQUISIÇÃO DA API TRAVA COM MAIS DE 1000 REQUISIÇÕES
    //CRESCENTE OU DECRESCENTE COM BASE EM QUE?
    
    
}

