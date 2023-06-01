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
        let count = checkIfCategoryExist(request: request)
        if count == 0{
            for category in allIncomeCategories {
                
                
                
                
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
            
            
            
            for category in allExpensesCategories {
                
                
                
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
    
    func checkIfCategoryExist(request : NSFetchRequest<any NSFetchRequestResult>) -> Int{
        
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
    
    
    func getAllCategories(type : String) -> [Category]{
        let request : NSFetchRequest<Category> = Category.fetchRequest()
        request.predicate = NSPredicate(format: "type == %@", type)

        
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
    func saveBudget(max_budget : String, initialDate : Date, endDate : Date, category_name : String, category_type : String){
        let budget = Budget(context: viewContext)
        budget.startDate = initialDate
        budget.endDate = endDate
        budget.maxBudget = Int64(max_budget)!
        let category = Category(context: viewContext)
        category.name = category_name
        category.type = category_type
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
    
    func getAllBudgetInfo() -> [BudgetInfoStruct]{
        let request : NSFetchRequest<Budget> = Budget.fetchRequest()
        var resultData : [BudgetInfoStruct] = []

        
        do{
            let result = try viewContext.fetch(request)
            for data in result {
                let value = getSumExpenseTransactionByCategoryName(category_name: data.category?.name ?? "")
                let budgetinfo = BudgetInfoStruct(totalAmount: value, id: UUID(), category_name: data.category?.name ?? "", max_value: Int64(data.maxBudget))
                resultData.append(budgetinfo)
            }
            return resultData
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
    
    func getSumTransaction(type : String) -> Int{
        let request : NSFetchRequest<Transaction> = Transaction.fetchRequest()
        request.predicate = NSPredicate(format: "category.type == %@", type)
        request.resultType = .dictionaryResultType
        let sumExpression = NSExpressionDescription()
        sumExpression.name = "sumAmount"
        sumExpression.expression = NSExpression(forFunction: "sum:", arguments: [NSExpression(forKeyPath: "amount")])
        sumExpression.expressionResultType = .doubleAttributeType
        
        request.propertiesToFetch = [sumExpression]
        do{
            let results = try viewContext.fetch(request) as! [NSDictionary]
            
            // Access the aggregated value
            if let totalQuantity = results.first?["sumAmount"] as? Int {
                return totalQuantity
            }
        }catch{
            print("There is some error : \(error)")
            
        }
        return 0
    }
    
    func getSumExpenseTransactionByCategoryName(category_name : String) -> Int{
        let request : NSFetchRequest<Transaction> = Transaction.fetchRequest()
        request.predicate = NSPredicate(format: "category.name == %@", category_name)
        request.resultType = .dictionaryResultType
        let sumExpression = NSExpressionDescription()
        sumExpression.name = "sumAmount"
        sumExpression.expression = NSExpression(forFunction: "sum:", arguments: [NSExpression(forKeyPath: "amount")])
        sumExpression.expressionResultType = .doubleAttributeType
        
        request.propertiesToFetch = [sumExpression]
        do{
            let results = try viewContext.fetch(request) as! [NSDictionary]
            
            // Access the aggregated value
            if let totalQuantity = results.first?["sumAmount"] as? Int {
                return totalQuantity
            }
        }catch{
            print("There is some error : \(error)")
            
        }
        return 0
    }
    
    func removeAllTransaction(){
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "Transaction")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        do{
            let results = try viewContext.fetch(fetchRequest)
            for object in results {
                guard let objectData = object as? NSManagedObject else {continue}
                viewContext.delete(objectData)
            }
            try? viewContext.save()
        }catch{
            
        }
    }
    
    func getLatestTransaction(n : Int) -> [Transaction]{
        let fetchRequest : NSFetchRequest<Transaction> = Transaction.fetchRequest()
        var transactionSort = NSSortDescriptor(key:"date", ascending:false)
        fetchRequest.sortDescriptors = [transactionSort]
        if n > 0 {
            fetchRequest.fetchLimit = n
        }
        do {
            return try viewContext.fetch(fetchRequest)
        } catch {
            print("Cannot fetch Expenses")
        }
        return []
    }
    
    func getSumTransactionByMonth(type : String) -> [ChartInfoStruct]{
                
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Transaction")
        fetchRequest.predicate = NSPredicate(format: "category.type == %@", type)
        var result : [ChartInfoStruct] = []
            // Perform the fetch request
            do {
                let fetchedObjects = try? viewContext.fetch(fetchRequest) as? [Transaction]
                if fetchedObjects != nil {
                    let resultData = Dictionary(grouping: fetchedObjects!) { elemen in
                        return elemen.date?.month
                    }
                    for key in resultData.keys{
                        var monthName = DateFormatter().monthSymbols[key ?? 1 - 1]
                        var totalAmount = (resultData[key ?? 1]?.reduce(0, {$0 + $1.amount}))!
                        let chartInfo = ChartInfoStruct(id: UUID(), monthName: monthName, totalAmount: Int(totalAmount))
                        result.append(chartInfo)
                    }
                }
                
            } catch {
                print("Error fetching data: \(error)")
            }
        print(result)
        return result
            
    }
    
    func getAllExpensesTransaction() -> [Transaction]{
        let request : NSFetchRequest<Transaction> = Transaction.fetchRequest()
        request.predicate = NSPredicate(format: "category.type == %@", "expense")
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
    func addTransaction(type : String, amount : Int64, note : String, category_name : String, category_type : String){
        let transaction = Transaction(context: viewContext)
        transaction.type = type
        transaction.amount = amount
        transaction.note = note
        transaction.date = Date()
        let category = Category(context: viewContext)
        category.name = category_name
        category.type = category_type
        transaction.category = category
       
        try! viewContext.save()
            print("Added")
        
        
    }
    
    func updateTransaction(id : NSManagedObjectID,type : String, amount : Int64, note : String, category_name : String, category_type : String){
        let transaction = getTransactionById(id: id)
        transaction?.type = type
        transaction?.amount = amount
        transaction?.note = note
        transaction?.category?.name = category_name
        transaction?.category?.type = category_type
       
        try! viewContext.save()
            print("Added")
    }
    
//    func removeAllTransaction(){
//        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "Transaction")
//        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
//        do{
//            let results = try viewContext.fetch(fetchRequest)
//            for object in results {
//                print(object)
//                guard let objectData = object as? NSManagedObject else {continue}
//                viewContext.delete(objectData)
//            }
//            try viewContext.save()
//        }catch{
//            print("Error : \(error)")
//        }
//
//    }
    
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
