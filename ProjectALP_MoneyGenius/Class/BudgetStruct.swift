//
//  BudgetStruct.swift
//  ProjectALP_MoneyGenius
//
//  Created by MacBook Pro on 25/05/23.
//

import Foundation
import CoreData

struct BudgetStruct{
   
    var budget : Budget
    
    var id : NSManagedObjectID {
        return budget.objectID
    }
    
    var maxBudget : Int64 {
        return budget.maxBudget
    }
    
    var startDate : Date {
        return budget.startDate!
    }
    
    var endDate : Date{
        return budget.endDate!
    }
}
