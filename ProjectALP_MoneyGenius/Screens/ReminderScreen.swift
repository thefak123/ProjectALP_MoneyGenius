//
//  ReminderScreen.swift
//  ProjectALP_MoneyGenius
//
//  Created by MacBook Pro on 02/06/23.
//

import SwiftUI

struct ReminderScreen: View {
    @StateObject var viewModel = ReminderViewModel()
    @Binding var path: NavigationPath
   
    func deleteReminder(offsets: IndexSet) {
        offsets.forEach { index in
            viewModel.deleteReminder(index: index)
        }
    }

    var body: some View {
        ZStack(alignment: .top) {
            Color.white.edgesIgnoringSafeArea(.all)
            
            List {
                Section {
                    HStack {
                        Text("Reminders")
                        Spacer()
                        Image(systemName: "plus")
                            .onTapGesture {
                                path.append("addupreminderscreen")
                            }
                    }
                    ForEach(viewModel.reminders, id: \.id) { reminder in
                        ReminderCardComponent(reminder: binding(for: reminder), path: $path)
                            .onTapGesture {
                                path.append(reminder)
                            }
                    }
                    .onDelete(perform: deleteReminder)
                }
            }
            
           
        }
        .onAppear {
            viewModel.getAllReminders()
        }
        .preferredColorScheme(.light)
    }

    private func binding(for reminder: ReminderStruct) -> Binding<ReminderStruct> {
        guard let reminderIndex = viewModel.reminders.firstIndex(of: reminder) else {
            fatalError("Cannot find index for the reminder")
        }
        return $viewModel.reminders[reminderIndex]
    }
}






struct ReminderScreen_Previews: PreviewProvider {
    @State static var path = NavigationPath()
    
    static var previews: some View {
        ReminderScreen(path: $path)
    }
}
