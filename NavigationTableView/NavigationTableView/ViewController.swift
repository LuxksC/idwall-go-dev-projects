//
//  ViewController.swift
//  NavigationTableView
//
//  Created by Sandra Monteiro de Castro on 15/03/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var receitas: [Receita] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initData()
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

    func initData() {
        receitas.append(Receita(image: "pave",name: "Pavê de chocolate", preparationTime: 40, ingredients: "1/2 Pacote de bolacha. 1/2 copo de leite. 1 colher(sobremesa) de chocolate em pó. 1 Lata de leite condensado. 2 gemas. 1 lata de leite de vaca", preparationSteps: "Em uma tigela, misture o leite e o chocolate em pó até que esteja completamente dissolvido. Molhe as bolachas no leite e reserve. Creme Branco: Em uma panela, leve todos os ingredientes ao fogo médio e misture até obter uma consistência grossa e cremosa. Creme de Chocolate: Repita o processo feito no creme branco. Cobertura: Bata as claras em neve com o açúcar até obter um creme consistente, adicione o creme de leite e misture delicadamente. Montagem: Em um refratário grande, despeje o creme branco, metade das bolachas, creme de chocolate, bolachas e claras em neve. Repita o processo até preencher todo o refratário e leve à geladeira por 40 minutos."))
    }
}

extension ViewController: UITableViewDelegate {
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return receitas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->  UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as? CustomTableViewCell else { return UITableViewCell() }
        
        let receita = receitas[indexPath.row]
        
        cell.setup(title: receita.name, image: receita.image)
        
        return cell
    }
    
    
    
    
}

