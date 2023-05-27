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
    
    // Category Area
    func fillTheDefaultCategories(){
        self.deleteAllCategories()
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Category")
        let allIncomeCategories = ["Main job", "Investment", "Side hustle", "Others"]
        let allExpensesCategories = ["Groceries", "Food or drink", "Job Expenses", "Utillities", "Entertaiment", "Insurance", "Others"]
        for category in allIncomeCategories {
            
            let count = checkIfCategoryExist(request: request, categoryName: category)
                
            if(count == 0){
            // no matching object
                let newCategory = Category(context: viewContext)
                newCategory.name = category
                newCategory.type = "income"
                do{
                    try viewContext.save()
                }catch{
                    print("There is some error : \(error)")
                }
            }
                
             
        }
        
        for category in allExpensesCategories {
            
            let count = checkIfCategoryExist(request: request, categoryName: category)
                
            if(count == 0){
            // no matching object
                let newCategory = Category(context: viewContext)
                newCategory.name = category
                newCategory.type = "expense"
                do{
                    try viewContext.save()
                }catch{
                    print("There is some error : \(error)")
                }
            }
                
             
        }
        
    }
    
    func checkIfCategoryExist(request : NSFetchRequest<any NSFetchRequestResult>, categoryName : String) -> Int{
        let predicate = NSPredicate(format: "name == %@", categoryName)
        request.predicate = predicate
        request.fetchLimit = 1
        var count = 0
        do{
            count = try viewContext.count(for: request)
        }catch let error as NSError{
            
        }
        return count
        
    }
    
    func getSumOfAllCategories(){
        // Create fetch request
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Transaction")

        // Create expression for sum aggregation
        let sumExpression = NSExpression(format: "sum:(amount)")

        // Create expression description
        let sumExpressionDescription = NSExpressionDescription()
        sumExpressionDescription.name = "sumResult"
        sumExpressionDescription.expression = sumExpression
        sumExpressionDescription.expressionResultType = .decimalAttributeType

        // Set properties to fetch
        fetchRequest.propertiesToFetch = [sumExpressionDescription]
        fetchRequest.resultType = .dictionaryResultType
        fetchRequest.returnsDistinctResults = true
        fetchRequest.propertiesToGroupBy = ["category_id"]

        // Perform fetch
        do {
            let results = try viewContext.fetch(fetchRequest) as! [NSDictionary]
            
            print(results)
        } catch {
            print("Error executing fetch request: \(error.localizedDescription)")
        }
    }
    
    func getAllCategories() -> [Category]{
        let request : NSFetchRequest<Category> = Category.fetchRequest()
        
        do{
            let result = try viewContext.fetch(request)
            return result
        }catch{
            print("There is some error : \(error)")
            return []
        }
    }
    
    func getAllExpensesCategories() -> [Category] {
        let request : NSFetchRequest<Category> = Category.fetchRequest()
        request.predicate = NSPredicate(format: "type == %@", "expense")
        do{
            let result = try viewContext.fetch(request)
            return result
        }catch{
            print("There is some error : \(error)")
            return []
        }
    }
    
    func deleteAllCategories(){
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "Category")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        do{
            let results = try viewContext.fetch(fetchRequest)
            for object in results {
                guard let objectData = object as? NSManagedObject else {continue}
                viewContext.delete(objectData)
            }
        }catch{
            
        }
    }
    
    
    
    
    
    
    
    // Budget Area
    func saveBudget(category_id : UUID, max_budget : String, initialDate : Date, endDate : Date){
        let budget = Budget(context: viewContext)
        budget.startDate = initialDate
        budget.endDate = endDate
        budget.maxBudget = Int64(max_budget)!
        do{
            try viewContext.save()
        }catch{
            print("error : \(error)")
        }
    }
    
    func getAllBudget() -> [Budget]{
        let request : NSFetchRequest<Budget> = Budget.fetchRequest()
  
        do{
            let result = try viewContext.fetch(request)
            print(result)
            return result
        }catch{
            print("There is some error : \(error)")
            return []
        }
    }
    
    
    
    
    
    
    
    
    
    
    // Transaction Area
    func getAllTransaction() -> [Transaction]{
        let request : NSFetchRequest<Transaction> = Transaction.fetchRequest()
        do{
            return try viewContext.fetch(request)
        }catch{
            return []
        }
    }
    
    func getAllExpensesTransaction() -> [Transaction]{
        let request : NSFetchRequest<Transaction> = Transaction.fetchRequest()
        request.predicate = NSPredicate(format: "category.name == %@", "expense")
        do{
            let result = try viewContext.fetch(request)
            return result
        }catch{
            print("There is some error : \(error)")
            return []
        }
    }
    
    func getSumOfExpensesTransactionByCatId(){
      
        
    }
    
    func getSumOfTransaction() -> Int{
        // Assuming you have a Core Data managed object context named "managedObjectContext"

        // Create a fetch request
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Transaction")

        // Create an expression description for the aggregation function
        let sumExpression = NSExpressionDescription()
        sumExpression.name = "totalAmount"
        sumExpression.expression = NSExpression(format: "@sum.amount")
        sumExpression.expressionResultType = .integer32AttributeType

        // Set the properties to fetch and the expression descriptions
        fetchRequest.propertiesToFetch = [sumExpression]
        fetchRequest.resultType = .dictionaryResultType

        do {
            // Execute the fetch request
            let results = try viewContext.fetch(fetchRequest) as! [NSDictionary]
            
            // Access the aggregated value
            if let totalQuantity = results.first?["totalAmount"] as? Int {
                return totalQuantity
            }
            
        } catch {
            print("Error executing fetch request: \(error)")
        }
        return 0
    }
    func save(){
        do{
            try viewContext.save()
        } catch{
            viewContext.rollback()
            print(error.localizedDescription)
        }
        
    }
    
    func getTransactionById(id : NSManagedObjectID) -> Transaction?{
        
        do{
            
            return try viewContext.existingObject(with: id) as? Transaction
        }catch{
            return nil
        }
           
    }
    
    func deleteTrancaction(trans : Transaction){
        viewContext.delete(trans)
        
        try? viewContext.save() 
    }
}
