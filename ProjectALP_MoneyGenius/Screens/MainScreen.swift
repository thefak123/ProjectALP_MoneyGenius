//
//  MainScreen.swift
//  ProjectALP_MoneyGenius
//
//  Created by MacBook Pro on 18/05/23.
//

import SwiftUI

struct MainScreen: View {
    @StateObject private var viewModel = TransactionViewModel()
    
    var body: some View {
        VStack{
            
            TextField("Enter transaction name", text: $viewModel.name)
            TextField("Enter transaction amount", text:Binding(
                get: { String(viewModel.amount) },
                set: {
                    if let val = Int($0)  {
                        viewModel.amount = val
                    } else {
                        viewModel.amount = 0
                    }
                    
                    
                }
            )).keyboardType(.numberPad)
                
            Button("Insert"){
                viewModel.insert()
                viewModel.getAllTransaction()
            }
            
            List(viewModel.transactions, id: \.id){ trans in
                VStack{
                    Text(trans.name)
                    Text(String(trans.amount))
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
