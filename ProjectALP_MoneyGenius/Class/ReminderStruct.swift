//
//  ReminderStruct.swift
//  ProjectALP_MoneyGenius
//
//  Created by MacBook Pro on 02/06/23.
//

import Foundation
import CoreData

struct ReminderStruct: Hashable {
    var reminder: Reminder
    
    var id: NSManagedObjectID {
        return reminder.objectID
    }
    
    
    var date: Date {
        get {
            reminder.date ?? Date()
        }
        set {
            reminder.date = newValue
        }
    }
    
    var note: String {
        get {
            reminder.note ?? ""
        }
        set {
            reminder.note = newValue
        }
    }
    
    var name: String {
        get {
            reminder.name ?? ""
        }
        set {
            reminder.name = newValue
        }
    }
    
    var active: Bool {
        get {
            reminder.active
        }
        set {
            reminder.active = newValue
        }
    }
}
