//
//  AddTransactionScreen.swift
//  ProjectALP_MoneyGenius
//
//  Created by MacBook Pro on 26/05/23.
//

import SwiftUI

struct AddTransactionScreen: View {
    var type : String
    @StateObject var viewModel = TransactionViewModel()
    var body: some View {
        VStack{
            TextInputComponent()
        }
    }
}

struct AddTransactionScreen_Previews: PreviewProvider {
    static var previews: some View {
        AddTransactionScreen(type: "Income")
    }
}
