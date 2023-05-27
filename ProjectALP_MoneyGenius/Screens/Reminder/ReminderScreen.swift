//
//  ReminderView.swift
//  ProjectALP_MoneyGenius
//
//  Created by MacBook Pro on 25/05/23.
//

import SwiftUI

struct ReminderScreen: View {
    var body: some View {
            NavigationStack {
                VStack(spacing: 0) {
                    Text("Reminder")
                        .font(.custom("Inter-Bold", size: 32))
                        .padding(.bottom,24)
                    HStack {
                        Text("Reminder")
                            .font(.custom("Inter-Bold", size: 20))
                        
                        Spacer()
                        
                        Image(systemName: "plus")
                            .font(.title)
                    }
                    .padding()
                    
                    Divider()
                        .background(Color.gray)
                    
                    ForEach(0..<3) { _ in
                        ReminderRow()
                    }
                }
                Spacer()
                
            }
        
        }
}

struct ReminderScreen_Previews: PreviewProvider {
    static var previews: some View {
        ReminderScreen()
    }
}
