//
//  CoreDataView.swift
//  CoreDataForFinalProject
//
//  Created by Sandra Monteiro de Castro on 24/03/22.
//

import SwiftUI
import CoreData

///Protocol for updating data from CoreData
protocol FetchFavoriteReposProtocol {
    func fetchFavoriteRepos()
}

///Protocol for adding data in CoreData
protocol AddFavoriteRepoProtocol {
    func addFavoriteRepo(newRepo: Repo)
    func saveInCoreData()
}

///Protocol for deleting data from CoreData
protocol DeleteFavoriteRepoProtocol {
    func deleteFavoriteRepo(uuid: String)
}

class CoreDataViewModel: ObservableObject {
    
    public var favoritesReposList: [RepoEntity] = []
    
    private let entity = "RepoEntity"
    
    //setting up CoreDataContainer
    let container: NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "CoreDataForFinalProject")
        
        //loading the data from CoreData Container
        container.loadPersistentStores { (description, error) in
            if let error = error {
                //will print if the name is incorrect
                print("Error loading Core Data: \(error)")
            }
        }
        fetchFavoriteRepos()
    }
    
}

extension CoreDataViewModel: FetchFavoriteReposProtocol {
    func fetchFavoriteRepos() {
        
        let context = container.viewContext
        
        let fetchRequest: NSFetchRequest<RepoEntity> = RepoEntity.fetchRequest()
        
        do {
            
            favoritesReposList = try context.fetch(fetchRequest)
            
        } catch let error as NSError {
            print("Deu ruim no request \(error.localizedDescription)")
        }
    }
}

extension CoreDataViewModel: AddFavoriteRepoProtocol {
    
    func addFavoriteRepo(newRepo: Repo) {
        let context = container.viewContext
        
        guard let entity = NSEntityDescription.entity(forEntityName: entity, in: context) else {return}
        
        let transaction = NSManagedObject(entity: entity, insertInto: context)
        
        transaction.setValue(newRepo.id, forKey: "id")
        transaction.setValue(newRepo.repoTitle, forKey: "repoTitle")
        transaction.setValue(newRepo.repoDescription, forKey: "repoDescription")
        transaction.setValue(newRepo.imageUrl, forKey: "imageUrl")
        
        saveInCoreData()
    }
    
    func saveInCoreData() {
        let context = container.viewContext
        
        do {
            try context.save()
            fetchFavoriteRepos() //updates database after saving
        } catch let error as NSError {
            print("Error saving. \(error.localizedDescription)")
        }
    }
}

extension CoreDataViewModel: DeleteFavoriteRepoProtocol {
    func deleteFavoriteRepo(uuid: String) {
        let context = container.viewContext
        
        let predicate = NSPredicate(format: "id == %@", "\(uuid)")
        
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: entity)
        
        fetchRequest.predicate = predicate
        
        do {
            
            //o casting é necessário para que o código saiba o que está trazendo do banco
            let fetchResults = try context.fetch(fetchRequest) as! [NSManagedObject]
            
            //garantindo que o id existe
            if let entityDelete = fetchResults.first {
                context.delete(entityDelete)
                saveInCoreData()
            }
            
            
        } catch let error as NSError {
            print("Error Deleting \(error.localizedDescription)")
        }
    }
    
    
}
    
struct CoreDataView: View {
    
    var viewModel = CoreDataViewModel()
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct CoreDataView_Previews: PreviewProvider {
    static var previews: some View {
        CoreDataView()
    }
}
