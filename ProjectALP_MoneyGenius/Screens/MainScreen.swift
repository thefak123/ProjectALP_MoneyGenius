//
//  MainScreen.swift
//  ProjectALP_MoneyGenius
//
//  Created by MacBook Pro on 18/05/23.
//

import SwiftUI

struct MainScreen: View {
    @StateObject private var viewModel = TransactionViewModel()
    
    @State var path = NavigationPath()
    func deleteTransaction(offsets : IndexSet){
        offsets.forEach{ index in
            viewModel.deleteTransaction(index: index)
        }
    }
    
    @State private var tabBar: UITabBar! = nil
    
    var body: some View {
        NavigationStack(path: $path){
            VStack{
//
//                TextField("Enter transaction name", text: $viewModel.name)
//                TextField("Enter transaction amount", text:Binding(
//                    get: { String(viewModel.amount) },
//                    set: {
//                        if let val = Int($0)  {
//                            viewModel.amount = val
//                        } else {
//                            viewModel.amount = 0
//                        }
//
//
//                    }
//                )).keyboardType(.numberPad)
//
//                Button("Insert"){
//                    viewModel.insert()
//                    viewModel.getAllTransaction()
//                }
//
//                Text(String(viewModel.getTotalSum())).font(.system(size: 35))
//
//                List{
//                    ForEach(viewModel.transactions, id: \.id){ trans in
//                        VStack{
//                            Text(trans.name)
//                            Text(String(trans.amount))
//                        }
//                    }.onDelete(perform: deleteTransaction)
//
//                }
                
                Button("to budget screen"){
                    path.append("budgetscreen")
                }
                
                Button("to transaction screen"){
                    path.append("transactionscreen")
                }
                
                
                
            }.onAppear{
//                viewModel.getAllTransaction()
//                viewModel.getSumOfTransactionByCatId()
            }.navigationDestination(for: String.self) { view in
                if view == "budgetscreen" {
                    
                    BudgetScreen(path: $path).toolbar(.hidden, for: .tabBar)
                    
                }else if view == "transactionscreen"{
                    TransactionScreen(path: $path)
                }else if view == "addtransactionincome"{
                    AddTransactionScreen(type: "income", path: $path)
                }else if view == "addtransactionoutcome"{
                    AddTransactionScreen(type: "expense", path: $path)
                }else if view == "addbudget"{
                    AddBudgetScreen()
                }
                
            }
            
        }
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}
