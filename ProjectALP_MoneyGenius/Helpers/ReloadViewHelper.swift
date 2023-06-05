//
//  ReloadViewHelper.swift
//  ProjectALP_MoneyGenius
//
//  Created by MacBook Pro on 05/06/23.
//

import Foundation

class ReloadViewHelper: ObservableObject {
    func reloadView() {
        objectWillChange.send()
    }
}
