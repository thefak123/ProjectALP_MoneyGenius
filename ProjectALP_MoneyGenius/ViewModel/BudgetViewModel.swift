//
//  BudgetViewModel.swift
//  ProjectALP_MoneyGenius
//
//  Created by MacBook Pro on 24/05/23.
//

import Foundation
import CoreData

class BudgetViewModel : ObservableObject{
    @Published var categoryName : String = "Select the category"
    @Published var categories : [CategoryStruct] = []
    @Published var budgets : [BudgetInfoStruct] = []
    var maxBudget : String = ""
    var startDate : Date = Date()
    var endDate : Date = Date()
    var amount : Int = 0
    let coreDataManager = CoreDataManager.shared
   
    
    func getAllExpenseCategories(){
        categories =  coreDataManager.getAllExpensesCategories().map(CategoryStruct.init)
        print(categories)
    }
    
    
    
    func insertNewBudget(){
        coreDataManager.saveBudget(max_budget: maxBudget, initialDate: startDate, endDate: endDate, category_name: categoryName, category_type: "expense")
    }
    
    func getAllBudgetInfo(){
        budgets = coreDataManager.getAllBudgetInfo()
    }
    
}
