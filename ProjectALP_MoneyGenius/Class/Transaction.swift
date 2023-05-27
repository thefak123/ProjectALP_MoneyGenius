//
//  Transaction.swift
//  ProjectALP_MoneyGenius
//
//  Created by MacBook Pro on 27/05/23.
//

import Foundation

struct TransactionStruct{
    var transaction : Transaction
    
    var id : UUID {
        return transaction.id!
    }
    
    var name : String {
        return transaction.name!
    }
    
    var amount : Int64 {
        return transaction.amount
    }
}
