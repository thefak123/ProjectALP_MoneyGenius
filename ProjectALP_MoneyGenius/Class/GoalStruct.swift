//
//  GoalStruct.swift
//  ProjectALP_MoneyGenius
//
//  Created by MacBook Pro on 04/06/23.
//

import Foundation
import CoreData

struct GoalStruct : Hashable{
    var goal : Goal
    
    var id : NSManagedObjectID {
        return goal.objectID
    }
    
    var name : String {
        return goal.name ?? ""
    }
    
    var note : String{
        return goal.note ?? ""
    }
    
    var amount : Int64{
        return goal.amount ?? 0
    }
    
    var isAchieved : Bool {
        return goal.isAchieved
    }
}
