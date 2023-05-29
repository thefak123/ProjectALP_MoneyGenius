//
//  MainViewModel.swift
//  ProjectALP_MoneyGenius
//
//  Created by MacBook Pro on 27/05/23.
//

import Foundation
import CoreData

class MainViewModel : ObservableObject{
    var name : String = ""
    var amount : Int = 0
    var type : String = ""
    
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
   
    
    func setDefaultCategories(){
        coreDataManager.fillTheDefaultCategories()
    }
    
    func sumAllTransaction(){
        
    }
    
    func removeAllTransaction(){
        coreDataManager.removeAllTransaction()
    }
    
    
    
    
}
