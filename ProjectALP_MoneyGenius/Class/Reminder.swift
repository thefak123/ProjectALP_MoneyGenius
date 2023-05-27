//
//  Reminder.swift
//  ProjectALP_MoneyGenius
//
//  Created by MacBook Pro on 25/05/23.
//

import Foundation

struct ReminderStruct {
    var reminder: Reminder
    
    var id: UUID {
        return reminder.id!
    }
    
    var name: String {
        return reminder.name!
    }
    
    var date: Date {
        return reminder.date!
    }
    
    var note: String {
        return reminder.note!
    }
    
    var active: Bool {
        return reminder.active
    }
}

