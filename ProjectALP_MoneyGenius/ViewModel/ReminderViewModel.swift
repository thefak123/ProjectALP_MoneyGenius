//
//  ReminderViewModel.swift
//  ProjectALP_MoneyGenius
//
//  Created by MacBook Pro on 02/06/23.
//

import Foundation
import CoreData

class ReminderViewModel: ObservableObject {
    var name: String = ""
    var note: String = ""
    var date: Date = Date()
    var active: Bool = false
    @Published var reminders: [ReminderStruct] = []
    let coreDataManager = CoreDataManager.shared
    
    func getAllReminders() {
        reminders = coreDataManager.getAllReminders().map(ReminderStruct.init)
    }
    
  
    func updateReminder(id: NSManagedObjectID) {
        coreDataManager.updateReminder(id: id, name: name, note: note, date: date, active: active)
    }
    
    func deleteReminder(index: Int) {
        let reminder = coreDataManager.getReminderById(id: reminders[index].id)
        coreDataManager.deleteReminder(reminder: reminder!)
        getAllReminders()
    }
    
    func emptyAllVariables() {
        name = ""
        note = ""
        date = Date()
        active = false
    }
    
    func addReminder() {
        coreDataManager.addReminder(name: name, note: note, date: date, active: active)
    }
    
    func removeAllReminders() {
        coreDataManager.removeAllReminders()
    }
}
