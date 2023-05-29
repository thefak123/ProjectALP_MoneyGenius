//
//  TransactionScreen.swift
//  ProjectALP_MoneyGenius
//
//  Created by MacBook Pro on 26/05/23.
//

import SwiftUI

struct TransactionScreen: View {
    
    @StateObject var viewModel = TransactionViewModel()
    @Binding var path : NavigationPath
    
    func deleteTransaction(offsets : IndexSet){
        offsets.forEach{ index in
            viewModel.deleteTransaction(index: index)
        }
    }
    
    
    
    var body: some View {
        List{
            Section{
                HStack {
                    Text("Today's Income")
                    Spacer()
                    Image(systemName: "plus").onTapGesture{
                        path.append("addtransactionincome")
                    }
                    
                    
                }
                ForEach(viewModel.transactions, id: \.id){ trans in
                    if trans.categoryType == "income" {
                        TransactionCardComponent(trans: trans).onTapGesture{
                            path.append(trans)
                        }
                        
                       
                    }
                }.onDelete(perform: deleteTransaction)
            }
            Section{
                HStack {
                    Text("Today's Outcome")
                    Spacer()
                    Image(systemName: "plus").onTapGesture{
                        path.append("addtransactionoutcome")
                    }
                    
                    
                }
                ForEach(viewModel.transactions, id: \.id){ trans in
                    if trans.categoryType == "expense" {
                        TransactionCardComponent(trans: trans).onTapGesture{
                            path.append(trans)
                        }
                        
                    }
                }.onDelete(perform: deleteTransaction)
                Spacer()
            }
            
        }.onAppear{
            viewModel.getAllTransaction()
        }
        
    }
}

struct TransactionScreen_Previews: PreviewProvider {
    @State static var path = NavigationPath()
    static var previews: some View {
        TransactionScreen(path: $path)
    }
}
