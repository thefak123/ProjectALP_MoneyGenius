//
//  GoalViewModel.swift
//  ProjectALP_MoneyGenius
//
//  Created by MacBook Pro on 04/06/23.
//

import Foundation
import CoreData

class GoalViewModel : ObservableObject {
    @Published var name :  String = ""
    @Published var note :  String = ""
    @Published var amount :  String = ""
    @Published var allGoal : [GoalStruct] = []

    let coreDataManager = CoreDataManager.shared
    
    func getAllGoal(){
        allGoal = coreDataManager.getAllGoal().map(GoalStruct.init)
    }
    
    
    func createGoal(){
        coreDataManager.createGoal(name: name, note: note, amount: Int64(amount) ?? 0)
    }
    
    func updateGoal(id : NSManagedObjectID){
        coreDataManager.updateGoal(id: id, name: name, note: note, amount: Int64(amount) ?? 0)
    }
    
    func updateSuccessGoal(id : NSManagedObjectID){
        coreDataManager.updateSuccessGoal(id: id, name: name, note: note, amount: Int64(amount) ?? 0)
    }
    
    func deleteGoal(index : Int){
        let goal = coreDataManager.findGoalByid(id: allGoal[index].id)
        coreDataManager.deleteGoal(goal: goal!)
        self.getAllGoal()
    }
}
