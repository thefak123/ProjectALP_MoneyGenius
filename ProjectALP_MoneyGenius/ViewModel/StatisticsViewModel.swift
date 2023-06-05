//
//  StatisticsViewModel.swift
//  ProjectALP_MoneyGenius
//
//  Created by MacBook Pro on 29/05/23.
//

import Foundation

class StatisticsViewModel : ObservableObject{
    
    let coreDataManager = CoreDataManager.shared
    @Published var data : [ChartArrayPart] = []
    @Published var latestTransaction : [TransactionStruct] = []
    @Published var totalExpense : Int = 0
    @Published var totalIncome : Int = 0
    @Published var selection : Int = Date().year

    
    func getSumTransactionByMonth(year : Int){
        data.removeAll()
        
        let income = coreDataManager.getSumTransactionByMonth(type: "income", year: year)
        let outcome = coreDataManager.getSumTransactionByMonth(type: "expense", year: year)
        data.append(ChartArrayPart(type: "Income \(selection)", data: income))
        data.append(ChartArrayPart(type: "Outcome \(selection)", data: outcome))
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
