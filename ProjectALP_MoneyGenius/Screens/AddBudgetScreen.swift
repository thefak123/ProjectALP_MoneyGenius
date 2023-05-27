//
//  AddBudgetScreen.swift
//  ProjectALP_MoneyGenius
//
//  Created by MacBook Pro on 24/05/23.
//

import SwiftUI

struct AddBudgetScreen: View {
    @StateObject var viewModel = BudgetViewModel()
    
    var body: some View {
            VStack(alignment: .leading) {
                Text("Add Budget").font(.title).padding(.bottom, 10)
                HStack{
                    Text("Select Category :")
                    Menu {
                        ForEach(viewModel.categories, id: \.id) {cat in
                            Button {
                                
                                viewModel.categoryName = cat.name
                            } label: {
                                Text(cat.name)
                                
                            }
                        }
                        
                        
                        
                        
                    } label: {
                        Text(viewModel.categoryName).foregroundColor(Color(UIColor.lightGray)).padding(10)
                        
                        
                    }.border(Color(UIColor.lightGray))
                }.padding(.bottom, 10)
                Text("Max Budget")
                TextField("Enter max budget", text: $viewModel.maxBudget).textFieldStyle(.roundedBorder).padding(.bottom, 10)
                
                DatePicker(selection: $viewModel.startDate, in: ...Date.now, displayedComponents: .date) {
                                Text("Select initial date")
                }.padding(.bottom, 10)
                
                DatePicker(selection: $viewModel.endDate, in: ...Date.now, displayedComponents: .date) {
                               Text("Select end date")
                }.padding(.bottom, 10)
                
                Button(action: {
                    viewModel.insertNewBudget()
                }){
                    Text("Add Budget").frame(width: 150 , height: 50, alignment: .center)
                }.buttonStyle(.borderedProminent).frame(maxWidth: .infinity, alignment: .center).padding(.top, 30)
                
                Spacer()
                
                
            }.padding(10).onAppear{
                viewModel.getAllExpenseCategories()
            }
           
    }
}

struct AddBudgetScreen_Previews: PreviewProvider {
    
    static var previews: some View {
        AddBudgetScreen()
    }
}
