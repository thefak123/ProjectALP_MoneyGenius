//
//  MainScreen.swift
//  ProjectALP_MoneyGenius
//
//  Created by MacBook Pro on 18/05/23.
//

import SwiftUI

struct MainScreen: View {
    @StateObject private var viewModel = MainViewModel()
    
    @State var path = NavigationPath()
    func deleteTransaction(offsets : IndexSet){
        offsets.forEach{ index in
            viewModel.deleteTransaction(index: index)
        }
    }
    
    @State private var tabBar: UITabBar! = nil
    
    var body: some View {
       
        #if os(iOS)
            #if targetEnvironment(macCatalyst)
                MacMainScreen()
            #else
        if UIDevice.current.userInterfaceIdiom == .pad{
                IpadMainScreen()
        }else{
            NavigationStack(path: $path){
                VStack{
                    HStack {
                        if viewModel.user == nil {
                            CImage(image: Image( "Ellipse"))
                                .frame(width: 56, height: 56)
                        }else{
                            Image(uiImage: viewModel.image)
                                .resizable()
                                .cornerRadius(50)
                                .frame(width: 56, height: 56)
                                .background(Color.black.opacity(0.2))
                                .aspectRatio(contentMode: .fill)
                                .clipShape(Circle())
                        }
                        
                        VStack(alignment: .leading) {
                            Text("Welcome back,")
                                .foregroundColor(.gray)
                                .font(.custom("Inter", size: 12))
                            Text(viewModel.user?.name ?? "Unknown")
                                .foregroundColor(.black)
                                .font(.custom("Inter", size: 18))
                        }
                        .padding(.leading,8)
                        Spacer()
                        
                        
                    }
                    .padding(.horizontal, 32)
                    
                    ZStack {
                        
                        Image("Card")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 400, height: 300)
                        
                        VStack(alignment: .leading){
                            Text("Balance")
                                .foregroundColor(.gray)
                                .font(.custom("Inter-Bold", size: 20))
                            
                            HStack {
                                Text("Rp")
                                    .foregroundColor(.white)
                                    .font(.custom("Inter", size: 24))
                                
                                Text(String(viewModel.saldo))
                                    .foregroundColor(.white)
                                    .font(.custom("Inter", size: 24))
                            }
                        }
                        .padding(.top,-64)
                        .padding(.leading,-120)
                        
                        
                    }
                    
                    VStack{
                        HStack{
                            MainScreenBlock(image:"Send", text: "Transactions", desc: "Income & Outcome").onTapGesture{
                                path.append("transactionscreen")
                            }
                            MainScreenBlock(image:"Wallet", text: "Goals", desc: "Your Goals").onTapGesture {
                                path.append("goalscreen")
                            }
                        }
                        HStack{
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
                        
                        BudgetScreen(path: $path).toolbar(.hidden, for: .tabBar)
                        
                    }else if view == "transactionscreen"{
                        TransactionScreen(path: $path)
                    }else if view == "addtransactionincome"{
                        AddTransactionScreen(type: "income", path: $path)
                    }else if view == "addtransactionoutcome"{
                        AddTransactionScreen(type: "expense", path: $path)
                    }else if view == "addbudget"{
                        AddBudgetScreen(path: $path)
                    }else if view == "goalscreen"{
                        GoalScreen(path: $path)
                    }else if view == "addgoal"{
                        CreateGoalScreen(path: $path)
                    }else if view == "reminderscreen" {
                        ReminderScreen(path: $path)
                    }else if view == "addupreminderscreen" {
                        AddUpReminderScreen(path: $path)
                    }
                    
                }.navigationDestination(for: GoalStruct.self) { goal in
                    CreateGoalScreen(goal: goal, path: $path)
                }.navigationDestination(for: ReminderStruct.self) { reminder in
                    AddUpReminderScreen(reminder: reminder, path: $path)
                }.navigationDestination(for: TransactionStruct.self){trans in
                    AddTransactionScreen(trans: trans,type:trans.categoryType, path: $path)
                    
                }
            }
        }
            #endif
        #endif
       
        
            
            
        }
    }
    


struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}
