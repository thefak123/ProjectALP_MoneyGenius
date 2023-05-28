//
//  colorSlider.swift
//  ProjectALP_MoneyGenius
//
//  Created by MacBook Pro on 28/05/23.
//

import SwiftUI

struct colorSlider: View {
    @Binding var value: Double
    var textColor: Color
    
    var body: some View {
        HStack {
            Text(verbatim: "0")
                .foregroundColor(textColor)
            Slider(value: $value, in: 0.0...1.0)
            Text(verbatim: "255")
                .foregroundColor(textColor)
            
        }
    }
}
