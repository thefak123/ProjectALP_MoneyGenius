//
//  TransactionCardComponent.swift
//  ProjectALP_MoneyGenius
//
//  Created by MacBook Pro on 29/05/23.
//

import SwiftUI

struct TransactionCardComponent: View {
    var trans : TransactionStruct
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(trans.categoryName).fontWeight(.bold).font(.system(size:17))
                Text(trans.note)
            }
            Spacer()
            Text("Rp. \(String(trans.amount))").fontWeight(.bold)
        }
    }
}


