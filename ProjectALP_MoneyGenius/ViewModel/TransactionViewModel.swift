//
//  TransactionViewModel.swift
//  ProjectALP_MoneyGenius
//
//  Created by MacBook Pro on 18/05/23.
//

import Foundation
import CoreData

class TransactionViewModel : ObservableObject{
    var amount : String = ""
    @Published var category : CategoryStruct? = nil
    @Published var transactions : [TransactionStruct] = []
    @Published var categories : [CategoryStruct] = []
    var note : String = ""
    let coreDataManager = CoreDataManager.shared
    var type : String = ""
    
    func getAllTransaction() {
        transactions = coreDataManager.getAllTransaction().map(TransactionStruct.init)
        print(transactions[transactions.count - 1].transaction)
        
    }
    
    
    
    func deleteTransaction(index : Int){
        let trans = coreDataManager.getTransactionById(id: transactions[index].id)
        coreDataManager.deleteTrancaction(trans: trans!)
        self.getAllTransaction()
    }
    
    func getTotalSum() -> Int{
        return coreDataManager.getSumOfTransaction()
    }
    
    func emptyAllVariables(){
        self.note = ""
        self.type = ""
        self.amount = ""
        self.category = nil
    }
    
    func getSumOfTransactionByCatId(){
//        coreDataManager.getSumOfTransactionByCatId()
    }
    
    func getAllCategories(type : String){
        categories = coreDataManager.getAllCategories(type: type).map(CategoryStruct.init)
    }
    
    func addTransaction(){
        if category != nil{
            coreDataManager.addTransaction(type: type, amount: Int64(amount) ?? 0, note: note, category_name: category?.name ?? "", category_type: category?.type ?? "")
        }
    }
    
    func sumAllTransaction(){
        
    }
    
    
    
    
}
