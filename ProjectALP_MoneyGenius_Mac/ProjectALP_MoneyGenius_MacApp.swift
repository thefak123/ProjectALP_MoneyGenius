//
//  ProjectALP_MoneyGenius_MacApp.swift
//  ProjectALP_MoneyGenius_Mac
//
//  Created by MacBook Pro on 02/06/23.
//

import SwiftUI

@main
struct ProjectALP_MoneyGenius_MacApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
