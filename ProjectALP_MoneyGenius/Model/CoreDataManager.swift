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
    
    // User Area
    func getTotalBalanceUser() -> Int{
        let income = getSumTransaction(type: "income")
        let outcome = getSumTransaction(type: "expense")
        return income - outcome
    }
    
    func setUserProfile(username : String, image : String) -> Bool{
        let users = self.getCurrentUser()
        if users.count == 0{
            let user = User(context:viewContext)
            user.name = username
            user.profileImage = image
            do{
                
                try viewContext.save()
                return true
            }catch{
                print("Error : \(error)")
                return false
            }
        }else{
            let user = users[0]
            user.name = username
            user.profileImage = image
            do{
                
                try viewContext.save()
                return true
            }catch{
                print("Error : \(error)")
                return false
            }
            
        }
        return false
        
    }
    
    func getCurrentUser() -> [User]{
        let request : NSFetchRequest<User> = User.fetchRequest()
        do{
            let user = try viewContext.fetch(request)
            return user
        }catch{
            print("Error : \(error)")
        }
        return []
    }
    
    
    // Category Area
    func fillTheDefaultCategories(){
        let data = getAllCategories(type: "income")
        if data.count == 0{
            setDefaultCategories()
        }
        
    }
    
    
    
    func setDefaultCategories(){
        let allIncomeCategories = ["Main job", "Investment", "Side hustle", "Others"]
        let allExpensesCategories = ["Groceries", "Food or drink", "Job Expenses", "Utillities", "Entertaiment", "Insurance", "Others"]
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
        budget.category = category
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

        // Get today's beginning & end
        var resultData : [BudgetInfoStruct] = []
        
         
            
        let datePredicate = NSPredicate(format: "(%@ >= startDate) AND (%@ <= endDate)", NSDate(), NSDate())
        request.predicate = datePredicate
        
        do{
            let result = try viewContext.fetch(request)
            for data in result {
                let value = getSumExpenseTransactionByCategoryName(category_name: data.category?.name ?? "")
                let budgetinfo = BudgetInfoStruct(budget: data, totalAmount: value, id: UUID(), category_name: data.category?.name ?? "", max_value: Int64(data.maxBudget))
                resultData.append(budgetinfo)
            }
            return resultData
        }catch{
            print("There is some error : \(error)")
            return []
        }
    }
    
    func getBudgetByCatName(name : String) -> Budget?{
        let request : NSFetchRequest<Budget> = Budget.fetchRequest()
        request.predicate = NSPredicate(format: "category.name == %@", name)
        do{
            
            return try viewContext.fetch(request) as? Budget
        }catch{
            return nil
        }
           
    }
    
    func getBudgetById(id : NSManagedObjectID) -> Budget?{
        
        do{
            
            return try viewContext.existingObject(with: id) as? Budget
        }catch{
            return nil
        }
           
    }
    
    func deleteBudget(budget : Budget){
        viewContext.delete(budget)
        
        try? viewContext.save()
    }
    
    func deleteAllBudgets(){
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "Budget")
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
    
    //Reminder area
    func getAllReminders() -> [Reminder] {
        let request: NSFetchRequest<Reminder> = Reminder.fetchRequest()
        do {
            return try viewContext.fetch(request)
        } catch {
            return []
        }
    }

    func removeAllReminders() {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "Reminder")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        do {
            try viewContext.execute(deleteRequest)
            try viewContext.save()
        } catch {
            print("Error removing all reminders: \(error)")
        }
    }

    func updateReminder(id: NSManagedObjectID, name: String, note: String, date: Date, active: Bool) {
        let reminder = getReminderById(id: id)
        reminder?.name = name
        reminder?.note = note
        reminder?.date = date
        reminder?.active = active
        
        do {
            try viewContext.save()
            print("Reminder updated")
        } catch {
            print("Error updating reminder: \(error)")
        }
    }

    func getReminderById(id: NSManagedObjectID) -> Reminder? {
        do {
            return try viewContext.existingObject(with: id) as? Reminder
        } catch {
            return nil
        }
    }

    func deleteReminder(reminder: Reminder) {
        viewContext.delete(reminder)
        
        do {
            try viewContext.save()
            print("Reminder deleted")
        } catch {
            print("Error deleting reminder: \(error)")
        }
    }
    
    func deleteReminderDetail(id: NSManagedObjectID) {
           if let reminder = getReminderById(id: id) {
               viewContext.delete(reminder)
               
               do {
                   try viewContext.save()
                   print("Reminder deleted")
               } catch {
                   print("Error deleting reminder: \(error)")
               }
           }
       }
    func addReminder(name: String, note: String, date: Date, active: Bool) {
        let reminder = Reminder(context: viewContext)
        reminder.name = name
        reminder.note = note
        reminder.date = date
        reminder.active = active
        
        do {
            try viewContext.save()
            print("Reminder added")
        } catch {
            print("Error adding reminder: \(error)")
        }
    }
}
