//
//  BudgetViewModel.swift
//  ProjectALP_MoneyGenius
//
//  Created by MacBook Pro on 24/05/23.
//

import Foundation
import CoreData

class BudgetViewModel : ObservableObject{
    @Published var categoryId : UUID = UUID()
    @Published var categoryName : String = "Select the category"
    @Published var categories : [CategoryStruct] = []
    @Published var budgets : [BudgetStruct] = []
    var maxBudget : String = ""
    var startDate : Date = Date()
    var endDate : Date = Date()
    var amount : Int = 0
    let coreDataManager = CoreDataManager.shared
   
    
    func getAllExpenseCategories(){
        categories =  coreDataManager.getAllExpensesCategories().map(CategoryStruct.init)
        print(categories)
    }
    
    func getAllBudgets() {
        budgets = coreDataManager.getAllBudget().map(BudgetStruct.init)
    }
    
    func insertNewBudget(){
        coreDataManager.saveBudget(category_id: categoryId, max_budget: maxBudget, initialDate: startDate, endDate: endDate)
    }
    
}
