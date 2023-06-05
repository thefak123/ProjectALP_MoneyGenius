//
//  CreateGoalScreen.swift
//  ProjectALP_MoneyGenius
//
//  Created by MacBook Pro on 04/06/23.
//

import SwiftUI

struct CreateGoalScreen: View {
    @StateObject var viewModel = GoalViewModel()
    var goal : GoalStruct? = nil
    @Binding var path : NavigationPath
    var body: some View {
        VStack{
            TextInputComponent(label:"Name", placeholder: "name", value:$viewModel.name)
            TextInputComponent(label:"Amount", placeholder: "amount", value:$viewModel.amount)
            
            HStack{
                Text("Note")
                Spacer()
            }
            TextEditor(text: $viewModel.note).overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color(UIColor.lightGray), lineWidth: 1)
            ).frame(height: 150)
            Button(action: {
                if goal != nil {
                    viewModel.updateGoal(id: goal!.id)
                    
                    
                }else{
                    viewModel.createGoal()
                    
                }
                path.removeLast()
            }){
                Text("\(goal != nil ? "Edit" : "Add") Goal").frame(width: 150 , height: 50, alignment: .center)
            }.background(Color.init(Theme.darkMainColor)).frame(maxWidth: .infinity, alignment: .center).padding(.top, 30)
            Spacer()
        }.padding(30).onAppear{
            if goal != nil {
                viewModel.name = goal!.name
                viewModel.amount = String(goal!.amount)
                viewModel.note = goal!.note
            }
        }.navigationBarItems(trailing: Text(goal != nil ? "ADD TO SUCCESS" : "").font(.system(size:15)).foregroundColor(.blue).onTapGesture {
            if goal != nil {
                viewModel.updateSuccessGoal(id: goal!.id)
                path.removeLast()
            }
            
        })
    }
}


