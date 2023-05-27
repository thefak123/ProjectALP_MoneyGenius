//
//  ProjectALP_MoneyGeniusApp.swift
//  ProjectALP_MoneyGenius
//
//  Created by MacBook Pro on 16/05/23.
//

import SwiftUI

@main
struct ProjectALP_MoneyGeniusApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
                    ContentView()
                        .environment(\.managedObjectContext, persistenceController.container.viewContext)
                }
      
    }
}
