//
//  AddUpTransactionScreen.swift
//  ProjectALP_MoneyGenius
//
//  Created by MacBook Pro on 02/06/23.
//

import SwiftUI

struct AddUpReminderScreen: View {
    var reminder: ReminderStruct? = nil
    @StateObject var viewModel = ReminderViewModel()
    @Binding var path: NavigationPath
    @State private var name: String = ""
    @State private var note: String = ""
    @State private var date: Date = Date()
    
    var body: some View {
        VStack(alignment: .leading) {
            TextInputComponent(label: "Name", placeholder: "Name", value: $name)
            Text("Note")
            TextEditor(text: $note)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(UIColor.lightGray), lineWidth: 1)
                )
                .frame(height: 150)
            
            DatePicker("Date", selection: $date, displayedComponents: [.date, .hourAndMinute])
            
            Button(action: {
                if reminder != nil {
                    updateReminder()
                } else {
                    addReminder()
                }
                
                path.removeLast()
            }) {
                Text("\(reminder != nil ? "Update" : "Add") Reminder")
                    .frame(width: 150, height: 50)
            }
            .buttonStyle(.borderedProminent)
            .frame(maxWidth: .infinity, alignment: .center)
            .padding(.top, 30)
            
            Spacer()
        }
        .padding(20)
        .onAppear {
            if let reminder = reminder {
                name = reminder.name
                note = reminder.note
                date = reminder.date
            }
        }
    }
    
    private func addReminder() {
        viewModel.name = name
        viewModel.note = note
        viewModel.date = date
        viewModel.active = true
        viewModel.addReminder()
    }

    private func updateReminder() {
        guard let reminder = reminder else {
            return
        }
        
        viewModel.name = name
        viewModel.note = note
        viewModel.date = date
        viewModel.updateReminder(id: reminder.id)
    }

}

struct ReminderAddUpScreen_Previews: PreviewProvider {
    @State static var path = NavigationPath()
    
    static var previews: some View {
        AddUpReminderScreen(path: $path)
    }
}
