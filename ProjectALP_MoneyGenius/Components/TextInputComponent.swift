//
//  TextInputComponent.swift
//  ProjectALP_MoneyGenius
//
//  Created by MacBook Pro on 26/05/23.
//

import SwiftUI

struct TextInputComponent: View {
    var label : String
    var placeholder : String
    @Binding var maxBudget : String
    
    
    var body: some View {
        VStack(alignment: .leading){
            Text(label)
            TextField(placeholder, text: $maxBudget).textFieldStyle(.roundedBorder).padding(.bottom, 10)
        }
    }
}

struct TextInputComponent_Previews:

    PreviewProvider {
    static var previews: some View {
        TextInputComponent(label: "Income budget", placeholder: "Enter income budget", maxBudget: .constant("true"))
    }
}
