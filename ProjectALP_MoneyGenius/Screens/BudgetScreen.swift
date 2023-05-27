//
//  BudgetScreen.swift
//  ProjectALP_MoneyGenius
//
//  Created by MacBook Pro on 24/05/23.
//

import SwiftUI

struct BudgetScreen: View {
    @State var progressValue: [Float] = [20, 30, 40, 50]
    @State var maxValue: [Float] = [100, 100, 100, 100]
    @Binding var path : NavigationPath
    @StateObject private var viewModel = BudgetViewModel()
    var body: some View {
        ZStack{
            List{
                    ProgressBarComponent(maxValue: $maxValue[0], progressValue: $progressValue[0], category: "Food").listRowSeparator(.hidden)
                
                
            }.scrollContentBackground(.hidden).floatingActionButton(color: .blue,
                                                                    image: Image(systemName: "plus")
                .foregroundColor(.white)){
                    path.append("addbudget")
                }
            Spacer()
        }.padding(20)
        
    }
}


