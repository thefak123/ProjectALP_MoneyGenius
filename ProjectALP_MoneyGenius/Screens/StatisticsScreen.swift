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
        VStack(alignment: .leading){
            Chart {
                ForEach(viewModel.data, id: \.type) { element in
                    ForEach(element.data) { data in
                        BarMark(x: .value("Month", data.monthName), y: .value("Total amount", data.totalAmount))
                        
                    }.foregroundStyle(by: .value("Type", element.type)).position(by: .value("Type", element.type))
                }
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
        }
    }
}

struct StatisticsScreen_Previews: PreviewProvider {
    static var previews: some View {
        StatisticsScreen()
    }
}
