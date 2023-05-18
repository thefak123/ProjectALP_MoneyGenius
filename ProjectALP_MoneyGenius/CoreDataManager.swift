//
//  CoreDataManager.swift
//  ProjectALP_MoneyGenius
//
//  Created by MacBook Pro on 18/05/23.
//

import Foundation
import CoreData

class CoreDataManager{
    let persistanceContainer : NSPersistentContainer
    static let shared = CoreDataManager()
    var viewContext : NSManagedObjectContext{
        return persistanceContainer.viewContext
    }
    private init(){
        persistanceContainer = NSPersistentContainer(name:"ProjectALP_MoneyGenius")
        persistanceContainer.loadPersistentStores { desc, err in
            if let err = err{
                print("The error is \(err)")
            }
        }
    }
    
    func getAllTransaction() -> [Transaction]{
        let request : NSFetchRequest<Transaction> = Transaction.fetchRequest()
        do{
            return try viewContext.fetch(request)
        }catch{
            return []
        }
    }
    
    func save(){
        do{
            try viewContext.save()
        } catch{
            viewContext.rollback()
            print(error.localizedDescription)
        }
        
    }
}
