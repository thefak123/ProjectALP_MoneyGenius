//
//  GoalScreen.swift
//  ProjectALP_MoneyGenius
//
//  Created by MacBook Pro on 04/06/23.
//

import SwiftUI

struct GoalScreen: View {
    @Binding var path : NavigationPath
    @StateObject var viewModel = GoalViewModel()
    
    func deleteGoal(offsets : IndexSet){
        offsets.forEach{ index in
            viewModel.deleteGoal(index: index)
        }
    }
    
    func binding(for goal: GoalStruct) -> Binding<GoalStruct> {
       guard let goalIndex = viewModel.allGoal.firstIndex(of: goal) else {
           fatalError("Cannot find index for the reminder")
       }
       return $viewModel.allGoal[goalIndex]
   }
    
    var body: some View {
        List{
            Section{
                HStack {
                    Text("Achieved Goal")
                    Spacer()
                    
                    
                    
                }
                ForEach(viewModel.allGoal, id: \.id){ goal in
                    if goal.isAchieved == true {
                        GoalCardComponent(goal: binding(for:goal))
                        
                       
                    }
                }.onDelete(perform: deleteGoal)
            }
            Section{
                HStack {
                    Text("Your Goals")
                    Spacer()
                    Image(systemName: "plus").onTapGesture{
                        path.append("addgoal")
                    }
                    
                    
                }
                ForEach(viewModel.allGoal, id: \.id){ goal in
                    if goal.isAchieved == false {
                        GoalCardComponent(goal:binding(for: goal)).onTapGesture{
                            path.append(goal)
                        }
                        
                    }
                }.onDelete(perform: deleteGoal)
                Spacer()
            }
            
        }.onAppear{
            print("bro")
            viewModel.getAllGoal()
        }
         
    }
}


