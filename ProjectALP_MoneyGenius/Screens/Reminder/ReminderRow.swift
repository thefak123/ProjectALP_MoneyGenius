//
//  ReminderRow.swift
//  ProjectALP_MoneyGenius
//
//  Created by MacBook Pro on 25/05/23.
//

import SwiftUI

struct ReminderRow: View {
    
    @State var active: Bool = false
    
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text("Title")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.black)
                Text("Subtitle")
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(.black)
                Text("Additional text")
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            Toggle("", isOn: $active)
        }
        .padding(.vertical, 4)
        .padding(.horizontal, 16)
        Divider()
            .background(Color.gray)
    }


}

struct ReminderRow_Previews: PreviewProvider {
    static var previews: some View {
        ReminderRow()
    }
}
