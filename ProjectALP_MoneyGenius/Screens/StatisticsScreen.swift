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
  
    func binding(for trans: TransactionStruct) -> Binding<TransactionStruct> {
        guard let transIndex = viewModel.latestTransaction.firstIndex(of: trans) else {
           fatalError("Cannot find index for the reminder")
       }
       return $viewModel.latestTransaction[transIndex]
   }
    var body: some View {
        
        VStack(alignment: .center){
            if viewModel.data.count != 0{
                if viewModel.data[0].data.count != 0{
                    
                   
                    Chart {
                        
                        ForEach(viewModel.data, id: \.type) { element in
                            ForEach(element.data) { data in
                                BarMark(x: .value("Month", data.monthName), y: .value("Total amount", data.totalAmount))
                                
                            }.foregroundStyle(by: .value("Type", element.type)).position(by: .value("Type", element.type))
                        }
                    }.frame(height: UIScreen.main.bounds.height / 4)
                    Picker("2023", selection: $viewModel.selection) {
                        ForEach(1950...Date().year, id: \.self) {
                            Text(String($0))
                        }
                    }.pickerStyle(.menu).onReceive(viewModel.$selection, perform: { value in
                        print("This is screen : \(value)")
                        viewModel.objectWillChange.send()
                        viewModel.getSumTransactionByMonth(year:value)
                        

                        
                    })
                    HStack(alignment: .center){
                        MainScreenBlock(image: "square.and.arrow.down", text: "Rp. \(viewModel.totalIncome)", desc: "Income", systemName: true)
                        MainScreenBlock(image: "square.and.arrow.up", text: "Rp. \(viewModel.totalExpense)", desc: "Outcome", systemName: true)
                    }.frame(height: UIScreen.main.bounds.height / 4)
                    Text("Latest Transaction").font(.title).fontWeight(.bold).padding([.top, .bottom], 20)
                    Divider()
                    ForEach(viewModel.latestTransaction, id:\.id){ trans in
                        TransactionCardComponent(trans: binding(for:trans))
                        Divider()
                        
                    }
                    
                    Spacer()
                }else {
                    Text("There is no data to display")
                }
            }
        }.padding(20).onAppear{
            viewModel.getSumTransactionByMonth(year:Date().year)
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
