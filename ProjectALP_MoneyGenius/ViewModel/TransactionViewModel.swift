//
//  TransactionViewModel.swift
//  ProjectALP_MoneyGenius
//
//  Created by MacBook Pro on 18/05/23.
//

import Foundation
import CoreData

class TransactionViewModel : ObservableObject{
    var name : String = ""
    var amount : Int = 0
    @Published var transactions : [TransactionStruct] = []
    let coreDataManager = CoreDataManager.shared
    
    func getAllTransaction() {
        transactions = coreDataManager.getAllTransaction().map(TransactionStruct.init)
    }
    
    func deleteTransaction(index : Int){
        let trans = coreDataManager.getTransactionById(id: transactions[index].id)
        coreDataManager.deleteTrancaction(trans: trans!)
        self.getAllTransaction()
    }
    
    func getTotalSum() -> Int{
        return coreDataManager.getSumOfTransaction()
    }
    
    func getSumOfTransactionByCatId(){
//        coreDataManager.getSumOfTransactionByCatId()
    }
    
    func insert(){
        let transaction = Transaction(context: coreDataManager.viewContext)
        transaction.amount = Int64(self.amount)
        transaction.name = self.name
        coreDataManager.save()
    }
    
    func sumAllTransaction(){
        
    }
    
    
    
    
}
