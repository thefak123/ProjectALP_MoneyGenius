//
//  DateExtension.swift
//  ProjectALP_MoneyGenius
//
//  Created by MacBook Pro on 29/05/23.
//

import Foundation

extension Date {
    
    var month: Int {
        return Calendar.current.component(.month, from: self)
    }
    
}
