//
//  Transaction.swift
//  ProjectALP_MoneyGenius
//
//  Created by MacBook Pro on 18/05/23.
//

import Foundation
import CoreData

struct TransactionStruct{
    var transaction : Transaction
    
    var id : NSManagedObjectID {
        return transaction.objectID
    }
    
    var name : String {
        return transaction.name!
    }
    
    var amount : Int64 {
        return transaction.amount
    }
}
