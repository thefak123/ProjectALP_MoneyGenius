//
//  AddTransactionScreen.swift
//  ProjectALP_MoneyGenius
//
//  Created by MacBook Pro on 26/05/23.
//

import SwiftUI

struct AddTransactionScreen: View {
    var trans : TransactionStruct? = nil
    var type : String
    @StateObject var viewModel = TransactionViewModel()
    @Binding var path : NavigationPath
    var body: some View {
        VStack(alignment: .leading){
            TextInputComponent(label:"Amount", placeholder: "amount", value:$viewModel.amount)
            Text("Select Category :")
            Menu {
                ForEach(viewModel.categories, id: \.id) {cat in
                    Button {
                        viewModel.category = cat
                    } label: {
                        Text(cat.name)
                    }
                }
                
                
                
                
            } label: {
                Text(viewModel.category?.name ?? "Select category").foregroundColor(Color(UIColor.lightGray)).padding(10)
                
            }
            Text("Note")
            TextEditor(text: $viewModel.note).overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color(UIColor.lightGray), lineWidth: 1)
            ).frame(height: 150)
            Button(action: {
                if trans != nil {
                    viewModel.updateTransaction(id: trans!.id)

                }else{
                    viewModel.addTransaction()

                }
                path.removeLast()
            }){
                Text("\(trans != nil ? "Edit" : "Add") Transaction").frame(width: 150 , height: 50, alignment: .center)
            }.buttonStyle(.borderedProminent).frame(maxWidth: .infinity, alignment: .center).padding(.top, 30)
            Spacer()
        }.padding(20).onAppear{
            viewModel.type = self.type
            viewModel.getAllCategories(type: self.type)
            viewModel.category = trans?.transaction.category.map(CategoryStruct.init)
            viewModel.note = trans?.note ?? ""
            viewModel.amount = String(trans?.amount ?? 0) 
            
        }
    }
}

struct AddTransactionScreen_Previews: PreviewProvider {
    @State static var path = NavigationPath()
    static var previews: some View {
        AddTransactionScreen(type: "Income", path: $path)
    }
}
