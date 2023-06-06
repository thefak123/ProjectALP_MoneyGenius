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
    
    var year: Int {
        return Calendar.current.component(.year, from: self)
    }
    
}

extension Date {
    public var removeTimeStamp : Date? {
       guard let date = Calendar.current.date(from: Calendar.current.dateComponents([.year, .month, .day], from: self)) else {
        return nil
       }
       return date
   }
}


