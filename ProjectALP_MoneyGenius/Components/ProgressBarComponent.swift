//
//  ProgressBarComponent.swift
//  ProjectALP_MoneyGenius
//
//  Created by MacBook Pro on 24/05/23.
//

import SwiftUI

struct ProgressBarComponent: View {
    var maxValue: Float
    var progressValue : Float
    var category : String
    
    var body: some View {
        Text(category).font(.title).font(.system(size:20)).frame(maxWidth: .infinity, alignment: .leading)
        HStack{
            Text("\(Int(progressValue))/\(Int(maxValue))").frame(maxWidth: .infinity, alignment: .trailing)
        }
        ProgressView(value: progressValue, total:maxValue).scaleEffect(x: 1, y: 4, anchor: .center).tint(progressValue >= maxValue ? .red : Color.init(Theme.darkMainColor))
    }
}


