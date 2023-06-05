//
//  ProjectALP_MoneyGeniusApp.swift
//  ProjectALP_MoneyGenius
//
//  Created by MacBook Pro on 16/05/23.
//

import SwiftUI
import UserNotifications

@main
struct ProjectALP_MoneyGeniusApp: App {
    let persistenceController = PersistenceController.shared
    @StateObject var reminderViewModel = ReminderViewModel()

    init() {
        // Permintaan izin notifikasi
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
            if let error = error {
                print("Error requesting notification authorization: \(error.localizedDescription)")
            } else if granted {
                print("Notification authorization granted")
            } else {
                print("Notification authorization denied")
            }
        }
    }

    var body: some Scene {
            WindowGroup {
                ContentView()
                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
                    .environmentObject(reminderViewModel).preferredColorScheme(.light)
            }
        }
}
