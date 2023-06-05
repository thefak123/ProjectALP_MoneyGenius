//
//  MacMainScreen.swift
//  ProjectALP_MoneyGenius
//
//  Created by MacBook Pro on 02/06/23.
//

import SwiftUI

struct MacMainScreen: View {
    @StateObject private var viewModel = MainViewModel()
    
    @State var path = NavigationPath()
    let theme = Theme()
    func deleteTransaction(offsets: IndexSet) {
        offsets.forEach { index in
            viewModel.deleteTransaction(index: index)
        }
    }
    
    var body: some View {
        NavigationStack(path: $path){
            ZStack {
                Color.white.ignoresSafeArea()
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
                    .padding(.top,-144)
                    
                    ZStack {
                        
                        Image("X-Card-3")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 800, height: 300)
                            .padding(.top,-64)
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
                        .padding(.top,-112)
                        .padding(.leading,-320)
                        
                        
                    }
                    
                    VStack(spacing:32){
                        HStack(spacing: 48){
                            MainScreenBlock(image:"Send", text: "Transactions", desc: "Income & Outcome").onTapGesture{
                                path.append("transactionscreen")
                            }
                            MainScreenBlock(image:"Wallet", text: "Goals", desc: "Your Goals").onTapGesture{
                                path.append("goalscreen")
                            }
                        }
                        HStack(spacing: 48){
                            MainScreenBlock(image:"3 User", text: "Reminder", desc: "Set Your Reminder").onTapGesture {
                                path.append("reminderscreen")
                            }
                            MainScreenBlock(image:"Dolar", text: "Set Budget", desc: "Set Your Budget").onTapGesture{
                                path.append("budgetscreen")
                            }
                        }
                    }.padding(.top,-80).onAppear{
                        viewModel.getBalanceUser()
                        viewModel.getCurrentUser()
             
                    }
                    
                    
                    
                    
                }.navigationDestination(for: String.self) { view in
                    if view == "budgetscreen" {
                        
                        BudgetScreen(path: $path).navigationBarTitle("Budget Screen").toolbarBackground(Color.init(
                            Theme.darkMainColor),
                            for: .navigationBar)
                        .toolbarBackground(.visible, for: .navigationBar).toolbarColorScheme(.dark, for: .navigationBar)
                        
                    }else if view == "transactionscreen"{
                        TransactionScreen(path: $path).navigationBarTitle("Transaction").toolbarBackground(Color.init(
                            Theme.darkMainColor),
                            for: .navigationBar)
                        .toolbarBackground(.visible, for: .navigationBar).toolbarColorScheme(.dark, for: .navigationBar)

                          
                    }else if view == "addtransactionincome"{
                        AddTransactionScreen(type: "income", path: $path).navigationBarTitle("Add Income").toolbarBackground(Color.init(
                            Theme.darkMainColor),
                            for: .navigationBar)
                        .toolbarBackground(.visible, for: .navigationBar)
                    }else if view == "addtransactionoutcome"{
                        AddTransactionScreen(type: "expense", path: $path).navigationBarTitle("Add Outcome").toolbarBackground(Color.init(
                            Theme.darkMainColor),
                            for: .navigationBar)
                        .toolbarBackground(.visible, for: .navigationBar)
                    }else if view == "goalscreen"{
                        GoalScreen(path: $path).navigationBarTitle("Goal Screen").toolbarBackground(Color.init(
                            Theme.darkMainColor),
                            for: .navigationBar)
                        .toolbarBackground(.visible, for: .navigationBar)
                    }else if view == "addgoal"{
                        CreateGoalScreen(path: $path).navigationBarTitle("Create Goal").toolbarBackground(Color.init(
                            Theme.darkMainColor),
                            for: .navigationBar)
                        .toolbarBackground(.visible, for: .navigationBar)
                    }else if view == "addbudget"{
                        AddBudgetScreen(path: $path).navigationBarTitle("Add Budget").toolbarBackground(Color.init(
                            Theme.darkMainColor),
                            for: .navigationBar)
                        .toolbarBackground(.visible, for: .navigationBar)
                    }else if view == "reminderscreen" {
                        ReminderScreen(path: $path).navigationBarTitle("Reminder").toolbarBackground(Color.init(
                            Theme.darkMainColor),
                            for: .navigationBar)
                        .toolbarBackground(.visible, for: .navigationBar)
                    }else if view == "addupreminderscreen" {
                        AddUpReminderScreen(path: $path).navigationBarTitle("Add Reminder").toolbarBackground(Color.init(
                            Theme.darkMainColor),
                            for: .navigationBar)
                        .toolbarBackground(.visible, for: .navigationBar)
                    }
                    
                }.navigationDestination(for: GoalStruct.self) { goal in
                    CreateGoalScreen(goal: goal, path: $path).navigationBarTitle("Update Goal").toolbarBackground(Color.init(
                        Theme.darkMainColor),
                        for: .navigationBar)
                    .toolbarBackground(.visible, for: .navigationBar)
                }.navigationDestination(for: ReminderStruct.self) { reminder in
                    AddUpReminderScreen(reminder: reminder, path: $path).navigationBarTitle("Update Reminder").toolbarBackground(Color.init(
                        Theme.darkMainColor),
                        for: .navigationBar)
                    .toolbarBackground(.visible, for: .navigationBar)
                }.navigationDestination(for: TransactionStruct.self){trans in
                    AddTransactionScreen(trans: trans,type:trans.categoryType, path: $path).navigationBarTitle("Update Transaction").toolbarBackground(Color.init(
                        Theme.darkMainColor),
                        for: .navigationBar)
                    .toolbarBackground(.visible, for: .navigationBar)
                    
                }
                
            }
        }.tint(.white)
        
    }
}


struct MacMainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MacMainScreen()
    }
}
