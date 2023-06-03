//
//  ReminderViewModel.swift
//  ProjectALP_MoneyGenius
//
//  Created by MacBook Pro on 02/06/23.
//

import Foundation
import CoreData
import UserNotifications

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
    func deleteReminderDetail(id: NSManagedObjectID) {
            coreDataManager.deleteReminderDetail(id: id)
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

    func scheduleNotification(for reminder: ReminderStruct) {
            // Buat content notifikasi
            let content = UNMutableNotificationContent()
            content.title = "Reminder: \(reminder.name)"
            content.body = reminder.note
            content.sound = UNNotificationSound.default

            // Buat trigger notifikasi berdasarkan waktu
            let calendar = Calendar.current
            let components = calendar.dateComponents([.year, .month, .day, .hour, .minute], from: reminder.date)
            let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: false)

            // Buat request notifikasi
            let request = UNNotificationRequest(identifier: reminder.id.uriRepresentation().absoluteString, content: content, trigger: trigger)

            // Jadwalkan notifikasi
            UNUserNotificationCenter.current().add(request) { error in
                if let error = error {
                    print("Error scheduling notification: \(error.localizedDescription)")
                } else {
                    print("Notification scheduled successfully")
                }
            }
        }
    func removePendingNotification(for reminder: ReminderStruct) {
            let identifier = reminder.id.uriRepresentation().absoluteString
            UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [identifier])
        }



}
