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
    func deleteBudget(offsets : IndexSet){
        offsets.forEach{ index in
            viewModel.deleteBudget(index: index)
        }
    }
    var body: some View {
        ZStack{
            List{
                ForEach(viewModel.budgets, id: \.id){ budget in
                    ProgressBarComponent(maxValue: Float(budget.max_value), progressValue: Float(budget.totalAmount), category: budget.category_name).listRowSeparator(.hidden)
                }.onDelete(perform: deleteBudget)
                    
                
                
            }.scrollContentBackground(.hidden).floatingActionButton(color: .blue,
                                                                    image: Image(systemName: "plus")
                .foregroundColor(.white)){
                    path.append("addbudget")
                }
            Spacer()
        }.padding(20).onAppear{
            viewModel.getAllBudgetInfo()
        }
        
    }
}


