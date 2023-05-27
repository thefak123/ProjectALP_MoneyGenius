//
//  TransactionScreen.swift
//  ProjectALP_MoneyGenius
//
//  Created by MacBook Pro on 26/05/23.
//

import SwiftUI

struct TransactionScreen: View {
    
    @StateObject var viewModel = TransactionViewModel()
    
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
                    Image(systemName: "plus")
                }
                ForEach(viewModel.transactions, id: \.id){ trans in
                    VStack{
                        Text(trans.name)
                        Text(String(trans.amount))
                    }
                }.onDelete(perform: deleteTransaction)
            }
            Spacer()
            VStack{
                HStack {
                    Text("Today's Outcome")
                    Spacer()
                    Image(systemName: "plus")
                }
                ForEach(viewModel.transactions, id: \.id){ trans in
                    VStack{
                        Text(trans.name)
                        Text(String(trans.amount))
                    }
                }.onDelete(perform: deleteTransaction)
                Spacer()
            }
            
        }
        
    }
}

struct TransactionScreen_Previews: PreviewProvider {
    static var previews: some View {
        TransactionScreen()
    }
}
