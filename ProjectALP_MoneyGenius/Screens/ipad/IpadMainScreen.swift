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
                    TransactionScreen(path: $path).navigationBarTitle("Transaction Screen")
                }else if view == "addtransactionincome"{
                    AddTransactionScreen(type: "income", path: $path).navigationBarTitle("Add Income")
                }else if view == "addtransactionoutcome"{
                    AddTransactionScreen(type: "expense", path: $path).navigationBarTitle("Add Outcome")
                }else if view == "addbudget"{
                    AddBudgetScreen(path: $path).navigationBarTitle("Add Budget")
                }else if view == "goalscreen"{
                    GoalScreen(path: $path).navigationBarTitle("Goal Screen")
                }else if view == "addgoal"{
                    CreateGoalScreen(path: $path).navigationBarTitle("Add Goal")
                }else if view == "reminderscreen" {
                    ReminderScreen(path: $path).navigationBarTitle("Reminder Screen")
                }else if view == "addupreminderscreen" {
                    AddUpReminderScreen(path: $path).navigationBarTitle("Add Reminder Screen")
                }
                
                
                
            }.navigationDestination(for: GoalStruct.self) { goal in
                CreateGoalScreen(goal: goal, path: $path).navigationBarTitle("Update Goal")
            }.navigationDestination(for: ReminderStruct.self) { reminder in
                AddUpReminderScreen(reminder: reminder, path: $path).navigationBarTitle("Update Reminder")
            }.navigationDestination(for: TransactionStruct.self){trans in
                AddTransactionScreen(trans: trans,type:trans.categoryType, path: $path).navigationBarTitle("Update Trasaction")
                
            }
        }
    }
}


struct IpadMainScreen_Previews: PreviewProvider {
    static var previews: some View {
        IpadMainScreen()
    }
}
