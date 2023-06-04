//
//  GoalCardComponent.swift
//  ProjectALP_MoneyGenius
//
//  Created by MacBook Pro on 04/06/23.
//

import SwiftUI

struct GoalCardComponent: View {
    @Binding var goal : GoalStruct
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(goal.name ?? "").fontWeight(.bold).font(.system(size:17))
                Text(goal.note ?? "")
            }
            Spacer()
            Text("Rp. \(String(goal.amount))").fontWeight(.bold)
        }
    }
}


