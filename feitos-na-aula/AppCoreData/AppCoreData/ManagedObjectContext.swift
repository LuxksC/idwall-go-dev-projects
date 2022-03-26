//
//  ManagedObjectContext.swift
//  AppCoreData
//
//  Created by Lucas de Castro Souza on 18/03/22.
//
import Foundation
import UIKit // Necessário para referências como UIApplication
import CoreData // necessário para acessar o banco na função getContext
typealias onCompletionHandler = (String) -> Void

protocol managedProtocol {
    func getPeople() -> [Person]
}

protocol managedSaveProtocol {
    func save(person: Person, onCompletionHandler: onCompletionHandler)
}

protocol managedDeleteProtocol {
    func delete(uuid: String, onCompletionHandler: onCompletionHandler )
}

class ManagedObjectContext: managedProtocol, managedSaveProtocol, managedDeleteProtocol {
    
    private let entity = "Users"
    
    public var listPerson: [Person] = []
    
    // forma de passar o Context para a ViewController
    static var shared: ManagedObjectContext = {
        let instance = ManagedObjectContext()
        return instance
    }()
    
    //essa função irá inicializar o contexto referente ao banco de dados e será necessária para que as funções abaixo possam manipular o banco de dados
    func getContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    func getPeople() -> [Person] {
        
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: entity)
        
        do {
            
            guard let people = try self.getContext().fetch(fetchRequest) as? [NSManagedObject] else {return listPerson}
            
            for item in people {
                if let id = item.value(forKey: "id") as? UUID,
                   let name = item.value(forKey: "name") as? String,
                   let lastName = item.value(forKey: "lastName") as? String,
                   let age = item.value(forKey: "age") as? Int {
                    
                    let person = Person(id: id, name: name, lastName: lastName, age: age)
                    
                    listPerson.append(person)
                }
            }
            
        } catch let error as NSError {
            print("Deu ruim no request \(error.localizedDescription)")
        }
        
        return listPerson
        //delete this return 
        
    }
    
    func save(person: Person, onCompletionHandler: (String) -> Void) {
        
        let context = getContext()
        
        guard let entity = NSEntityDescription.entity(forEntityName: entity, in: context) else {return}
        
        let transaction = NSManagedObject(entity: entity, insertInto: context)
        
        //adicionando valores da propriedade person ao aributo do banco de dados no id
        transaction.setValue(person.id, forKey: "id")
        transaction.setValue(person.name, forKey: "name")
        transaction.setValue(person.lastName, forKey: "lastName")
        transaction.setValue(person.age, forKey: "age")
        
        //salvando no banco
        do {
            
            try context.save()
            
            //usando a closure para tratar o resultado
            onCompletionHandler("Save Sucess")
            
        } catch let error as NSError {
            print("Deu ruim no save: \(error.localizedDescription)")
        }
    }
    
    func delete(uuid: String, onCompletionHandler: (String) -> Void) {
        
        let context = getContext()
        
        //predicate verifica se um dado (id) existe na base
        let predicate = NSPredicate(format: "id == %@", "\(uuid)")
        
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: entity)
        
        fetchRequest.predicate = predicate
        
        do {
            
            //o casting é necessário para que o código saiba o que está trazendo do banco
            let fetchResults = try context.fetch(fetchRequest) as! [NSManagedObject]
            
            //garantindo que o id existe
            if let entityDelete = fetchResults.first {
                context.delete(entityDelete)
            }
            
            //Não lembro o pq disso aqui
            try context.save()

            onCompletionHandler("Delete Sucess")
            
        } catch let error as NSError {
            print("Deu ruim no delete \(error.localizedDescription)")
        }
        
    }
    
    
}
