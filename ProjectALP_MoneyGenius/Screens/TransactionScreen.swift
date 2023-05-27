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
            VStack{
                HStack {
                    Text("Today's Income")
                    Spacer()
                    Button(action: {
                        path.append("addtransactionincome")
                    }) {
                        Image(systemName: "plus")
                    }
                    
                }
                Divider()
                ForEach(viewModel.transactions, id: \.id){ trans in
                    if trans.categoryType == "income" {
                        HStack{
                            VStack(alignment: .leading){
                                Text(trans.categoryName).fontWeight(.bold).font(.system(size:17))
                                Text(trans.note)
                            }
                            Spacer()
                            Text("Rp. \(String(trans.amount))").fontWeight(.bold)
                        }
                    }
                }.onDelete(perform: deleteTransaction)
            }
            VStack{
                HStack {
                    Text("Today's Outcome")
                    Spacer()
                    Button(action: {
                        path.append("addtransactionoutcome")
                    }) {
                        Image(systemName: "plus")
                    }
                    
                }
                Divider()
                ForEach(viewModel.transactions, id: \.id){ trans in
                    if trans.categoryType == "expense" {
                        HStack{
                            VStack(alignment: .leading){
                                Text(trans.categoryName).fontWeight(.bold).font(.system(size:17))
                                Text(trans.note)
                            }
                            Spacer()
                            Text("Rp. \(String(trans.amount))").fontWeight(.bold)
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
