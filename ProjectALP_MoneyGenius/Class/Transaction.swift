//
//  Transaction.swift
//  ProjectALP_MoneyGenius
//
//  Created by MacBook Pro on 18/05/23.
//

import Foundation
import CoreData

struct TransactionStruct : Hashable{
    var transaction : Transaction
    var id : NSManagedObjectID {
        return transaction.objectID
    }
    
    var amount : Int64 {
        return transaction.amount
    }
    
    var categoryName : String {
        return transaction.category?.name ?? ""
    }
    
    var categoryType : String {
        return transaction.category?.type ?? ""
    }
    
    var note : String {
        return transaction.note ?? ""
    }
    
    
}
