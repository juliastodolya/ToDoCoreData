//
//  StorageManager.swift
//  ToDoCoreData
//
//  Created by Юлия on 10.02.2021.
//


import CoreData

class StorageManager {
    
    static let shared = StorageManager()
    // MARK: - Core Data stack
    
    var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "ToDoCoreData")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    private var viewContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    private init() {}
    
// MARK: - Public methods
    
    func fetchData() -> [Task]  {
        let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
        do {
            return try viewContext.fetch(fetchRequest)
        } catch let error {
            print(error.localizedDescription)
            return []
        }
    }
    
    func save(_ taskName: String, completion: (Task) -> Void) {
        guard let entityDescription = NSEntityDescription.entity(forEntityName: "Task", in: viewContext) else { return }
        
        guard let task = NSManagedObject(entity: entityDescription, insertInto: viewContext) as? Task else { return }
        
        task.name = taskName
    
        completion(task)
        saveContext()
    }
    
    func edit(_ task: Task, newName: String) {
        task.name = newName
        saveContext()
    }
    
    func delete(_ task: Task) {
        viewContext.delete(task)
        saveContext()
    }
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
