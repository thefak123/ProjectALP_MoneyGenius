//
//  ReminderViewModel.swift
//  ProjectALP_MoneyGenius
//
//  Created by MacBook Pro on 25/05/23.
//

import Foundation
import CoreData

class ReminderViewModel: ObservableObject {
    var name: String = ""
    var date: Date = Date()
    var note: String = ""
    var active: Bool = false
    
    @Published var reminders: [ReminderStruct] = []
    let coreDataManager = CoreDataManager.shared
    
    func getAllReminders() {
        reminders = coreDataManager.getAllReminders().map(ReminderStruct.init)
    }
    
    func deleteReminder(index: Int) {
        coreDataManager.deleteReminder(reminder: reminders[index].reminder)
    }
    
    func insert() {
        let reminder = Reminder(context: coreDataManager.viewContext)
        reminder.id = UUID()
        reminder.name = self.name
        reminder.date = self.date
        reminder.note = self.note
        reminder.active = self.active
        coreDataManager.save()
    }
}
