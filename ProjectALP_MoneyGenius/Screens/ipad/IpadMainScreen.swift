//
//  IpadMainScreen.swift
//  ProjectALP_MoneyGenius
//
//  Created by MacBook Pro on 02/06/23.
//

import SwiftUI

struct IpadMainScreen: View {
    @StateObject private var viewModel = MainViewModel()
    
    @State var path = NavigationPath()
    
    func deleteTransaction(offsets: IndexSet) {
        offsets.forEach { index in
            viewModel.deleteTransaction(index: index)
        }
    }
    
    var body: some View {
        NavigationStack(path: $path){
            VStack{
                HStack {
                    if viewModel.user == nil {
                        CImage(image: Image( "Ellipse"))
                            .frame(width: 80, height: 80)
                    }else{
                        Image(uiImage: viewModel.image)
                            .resizable()
                            .cornerRadius(50)
                            .frame(width: 80, height: 80)
                            .background(Color.black.opacity(0.2))
                            .aspectRatio(contentMode: .fill)
                            .clipShape(Circle())
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Welcome back,")
                            .foregroundColor(.gray)
                            .font(.custom("Inter", size: 20))
                        Text(viewModel.user?.name ?? "Unknown")
                            .foregroundColor(.black)
                            .font(.custom("Inter", size: 24))
                    }
                    .padding(.leading,16)
                    Spacer()
                    
                    
                }
                .padding(.horizontal, 120)
                
                ZStack {
                    
                    Image("Card")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 600, height: 300)
                        .padding(.top,48)
                    VStack(alignment: .leading){
                        Text("Balance")
                            .foregroundColor(.gray)
                            .font(.custom("Inter-Bold", size: 32))
                        
                        HStack {
                            Text("Rp")
                                .foregroundColor(.white)
                                .font(.custom("Inter", size: 40))
                            
                            Text(String(viewModel.saldo))
                                .foregroundColor(.white)
                                .font(.custom("Inter", size: 40))
                        }
                    }
                    .padding(.top,-56)
                    .padding(.leading,-224)
                    
                    
                }
                
                VStack(spacing:32){
                    HStack(spacing: 32){
                        MainScreenBlock(image:"Send", text: "Transactions", desc: "Income & Outcome").onTapGesture{
                            path.append("transactionscreen")
                        }
                        MainScreenBlock(image:"Wallet", text: "Goals", desc: "Your Goals")
                    }
                    HStack(spacing: 32){
                        MainScreenBlock(image:"3 User", text: "Reminder", desc: "Set Your Reminder").onTapGesture {
                            path.append("reminderscreen")
                        }
                        MainScreenBlock(image:"Dolar", text: "Set Budget", desc: "Set Your Budget").onTapGesture{
                            path.append("budgetscreen")
                        }
                    }
                }.padding(.top,-32).onAppear{
                    viewModel.getBalanceUser()
                    viewModel.getCurrentUser()
                }
                
                
                
                
            }.navigationDestination(for: String.self) { view in
                if view == "budgetscreen" {
                    
                    BudgetScreen(path: $path).toolbar(.hidden, for: .tabBar)
                    
                }else if view == "transactionscreen"{
                    TransactionScreen(path: $path)
                }else if view == "addtransactionincome"{
                    AddTransactionScreen(type: "income", path: $path)
                }else if view == "addtransactionoutcome"{
                    AddTransactionScreen(type: "expense", path: $path)
                }else if view == "addbudget"{
                    AddBudgetScreen(path: $path)
                }else if view == "reminderscreen" {
                    ReminderScreen(path: $path)
                }else if view == "addupreminderscreen" {
                    AddUpReminderScreen(path: $path)
                }
                
            }.navigationDestination(for: ReminderStruct.self) { reminder in
                AddUpReminderScreen(reminder: reminder, path: $path)
            }.navigationDestination(for: TransactionStruct.self){trans in
                AddTransactionScreen(trans: trans,type:trans.categoryType, path: $path)
                
            }
        }
    }
}


struct IpadMainScreen_Previews: PreviewProvider {
    static var previews: some View {
        IpadMainScreen()
    }
}
