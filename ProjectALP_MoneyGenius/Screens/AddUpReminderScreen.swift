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
    @State private var isUpdating: Bool = false

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
                    .frame(width: 150, height: 50).foregroundColor(.white)
            }
            .background(Color.init(Theme.darkMainColor))
            .frame(maxWidth: .infinity, alignment: .center)
            .padding(.top, 30)
            
            Spacer()
        }
        .padding(20)
        .navigationBarItems(trailing: deleteButton)
        .onAppear {
            if let reminder = reminder {
                name = reminder.name
                note = reminder.note
                date = reminder.date
                isUpdating = true
            }
        }
        .preferredColorScheme(.light)
    }
    
    private func addReminder() {
        viewModel.name = name
        viewModel.note = note
        viewModel.date = date
        viewModel.active = true
        if viewModel.name != "" && viewModel.note != ""{
            viewModel.addReminder()
        }
    }

    private func updateReminder() {
        guard let reminder = reminder else {
            return
        }
        
        viewModel.name = name
        viewModel.note = note
        viewModel.date = date
        viewModel.active = true
        if viewModel.name != "" && viewModel.note != ""{
            viewModel.updateReminder(id: reminder.id)
            
        }
        
    }
    
    private func deleteReminder() {
        if isUpdating {
            if let reminder = reminder {
                viewModel.deleteReminderDetail(id: reminder.id)
                path.removeLast()
            }
        }
    }


    private var deleteButton: some View {
        if isUpdating {
            return AnyView(
                Button(action: {
                    deleteReminder()
                }) {
                    Image(systemName: "trash")
                }
            )
        } else {
            return AnyView(EmptyView())
        }
    }
}

struct ReminderAddUpScreen_Previews: PreviewProvider {
    @State static var path = NavigationPath()
    
    static var previews: some View {
        AddUpReminderScreen(path: $path)
    }
}
