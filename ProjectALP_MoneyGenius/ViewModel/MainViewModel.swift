//
//  MainViewModel.swift
//  ProjectALP_MoneyGenius
//
//  Created by MacBook Pro on 27/05/23.
//

import Foundation
import CoreData
import SwiftUI
class MainViewModel : ObservableObject{
    var name : String = ""
    var amount : Int = 0
    var type : String = ""
    var user : UserStruct? = nil
    @Published var image = UIImage()
    @Published var saldo : Int = 0
    @Published var transactions : [TransactionStruct] = []
    
    let coreDataManager = CoreDataManager.shared
    
    func getAllTransaction() {
        transactions = coreDataManager.getAllTransaction().map(TransactionStruct.init)
    }
    
    func getBalanceUser(){
        saldo = coreDataManager.getTotalBalanceUser()
    }
    
    func removeAllCategories(){
        coreDataManager.deleteAllCategories()
    }
    
    func deleteTransaction(index : Int){
        let trans = coreDataManager.getTransactionById(id: transactions[index].id)
        coreDataManager.deleteTrancaction(trans: trans!)
        self.getAllTransaction()
    }
    
    func getCurrentUser(){
        let users = coreDataManager.getCurrentUser().map(UserStruct.init)
        if users.count != 0{
            user = users[0]
            image = loadImageFromDiskWith(fileName: user?.profileImage ?? "") ?? UIImage()
        }
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
