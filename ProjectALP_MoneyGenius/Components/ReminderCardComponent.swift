//
//  ReminderCardComponent.swift
//  ProjectALP_MoneyGenius
//
//  Created by MacBook Pro on 02/06/23.
//

import SwiftUI

struct ReminderCardComponent: View {
    @Binding var reminder: ReminderStruct
    @Binding var path: NavigationPath
    
    var body: some View {
        ZStack(alignment: .trailing) {
            HStack {
                VStack(alignment: .leading) {
                    Text(reminder.name)
                        .fontWeight(.bold)
                        .font(.system(size: 17))
                    Text(reminder.note)
                    Text(formatDate(reminder.date))
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                
                Spacer()
            }
            .contentShape(Rectangle())
            .onTapGesture {
                path.append(reminder)
            }
            
            Toggle("", isOn: $reminder.active)
                .toggleStyle(SwitchToggleStyle(tint: .green))
                .onTapGesture {
                   
                }
        }
    }
    
    private func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
}


