import CoreData

///Protocol for updating data from FavoritesRepos
protocol FetchTasksProtocol {
    func fetchTasks(onCompletionHandler: (Result<[Task], Error>) -> Void)
}

///Protocol for adding data in FavoritesRepos
protocol AddTaskProtocol {
    func addTask(title: String, desc: String, dueAt: Date?, status: Int)
    func saveData()
}

///Protocol for deleting data from FavoritesRepos
protocol DeleteTaskProtocol {
    func deleteTask(uuid: String)
}

class Persistence: ObservableObject {
    
    let container: NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "ToDoList")
        
        container.loadPersistentStores { (description, error) in
            if let error = error {
                print("Error loading Core Data: \(error)")
            }
        }
    }
}

extension Persistence: FetchTasksProtocol {
    func fetchTasks(onCompletionHandler: (Result<[Task], Error>) -> Void) {
        
        let context = container.viewContext
        
        let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
        
        do {
            
            let taskList = try context.fetch(fetchRequest)
            
            onCompletionHandler(.success(taskList))
            
        } catch let error {
            onCompletionHandler(.failure(error))
        }
    }
}

extension Persistence: AddTaskProtocol {
    
    func addTask(title: String, desc: String, dueAt: Date?, status: Int = 0) {
        let context = container.viewContext
        
        let task = Task(context: context)
        
        task.title = title
        task.desc = desc
        task.dueAt = dueAt
        task.status = Int16(status)
        task.id = UUID()
        task.createdAt = Date()
        
        saveData()
    }
    
    func saveData() {
        let context = container.viewContext
        
        do {
            try context.save()
        } catch let error {
            print("Error saving: \(error)")
        }
    }
}
