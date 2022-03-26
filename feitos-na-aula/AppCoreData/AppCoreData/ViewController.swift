//
//  ViewController.swift
//  AppCoreData
//
//  Created by Sandra Monteiro de Castro on 18/03/22.
//

import UIKit

class ViewController: UIViewController {
    
    var person: [Person] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    @IBAction func save() {
        
        //o ideal seria os dados virem de um form em vez de criado na função
        let person = Person(id: UUID(), name: "Lucas", lastName: "Castro", age: 69)
        
        ManagedObjectContext.shared.save(person: person) {result in print(result)}
    }
    
    @IBAction func getPerson() {
        
        person = ManagedObjectContext.shared.getPeople()
        print(person)
        
    }
    
    @IBAction func delete() {
        
        let id = ""
        
        ManagedObjectContext.shared.delete(uuid: id) {result in
            print(result)
        }
        
    }

}

