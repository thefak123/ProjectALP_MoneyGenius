//
//  StatisticsScreen.swift
//  ProjectALP_MoneyGenius
//
//  Created by MacBook Pro on 18/05/23.
//

import SwiftUI
import Charts

struct StatisticsScreen: View {
    @StateObject var viewModel = StatisticsViewModel()
    
    

    var body: some View {
        VStack(alignment: .center){
            Chart {
                ForEach(viewModel.data, id: \.type) { element in
                    ForEach(element.data) { data in
                        BarMark(x: .value("Month", data.monthName), y: .value("Total amount", data.totalAmount))
                        
                    }.foregroundStyle(by: .value("Type", element.type)).position(by: .value("Type", element.type))
                }
            }.frame(height: UIScreen.main.bounds.height / 4)
            HStack(alignment: .center){
                MainScreenBlock(image: "square.and.arrow.down", text: "Rp. \(viewModel.totalIncome)", desc: "Income", systemName: true)
                MainScreenBlock(image: "square.and.arrow.up", text: "Rp. \(viewModel.totalExpense)", desc: "Outcome", systemName: true)
            }.frame(height: UIScreen.main.bounds.height / 4)
            Text("Latest Transaction").font(.title).fontWeight(.bold).padding([.top, .bottom], 20)
                Divider()
                ForEach(viewModel.latestTransaction, id:\.id){ trans in
                    TransactionCardComponent(trans: trans)
                    Divider()
                    
                }
            
            Spacer()
        }.padding(20).onAppear{
            viewModel.getSumTransactionByMonth()
            viewModel.getLatestTransaction(n: 5)
            viewModel.getTotalExpenseTransaction()
            viewModel.getTotalIncomeTranasaction()
        }
    }
}

struct StatisticsScreen_Previews: PreviewProvider {
    static var previews: some View {
        StatisticsScreen()
    }
}
