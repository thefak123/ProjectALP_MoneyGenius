//
//  StatisticsViewModel.swift
//  ProjectALP_MoneyGenius
//
//  Created by MacBook Pro on 29/05/23.
//

import Foundation

class StatisticsViewModel : ObservableObject{
    
    let coreDataManager = CoreDataManager.shared
    @Published var data : [(type: String, data: [ChartInfoStruct])] = []
    @Published var latestTransaction : [TransactionStruct] = []
    @Published var totalExpense : Int = 0
    @Published var totalIncome : Int = 0

    
    func getSumTransactionByMonth(){
       
        let income = coreDataManager.getSumTransactionByMonth(type: "income")
        let outcome = coreDataManager.getSumTransactionByMonth(type: "expense")
        data.append((type: "Income", data: income))
        data.append((type: "Outcome", data: outcome))
        print(data)
    }
    
    func getLatestTransaction(n : Int){
        latestTransaction = coreDataManager.getLatestTransaction(n: n).map(TransactionStruct.init)
    }
    
    func getTotalExpenseTransaction(){
        totalExpense  = coreDataManager.getSumTransaction(type: "expense")
    }
    
    func getTotalIncomeTranasaction(){
        totalIncome = coreDataManager.getSumTransaction(type: "income")
    }
}
