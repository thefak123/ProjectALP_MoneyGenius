//
//  CategoryStruct.swift
//  ProjectALP_MoneyGenius
//
//  Created by MacBook Pro on 24/05/23.
//

import Foundation
import CoreData

struct CategoryStruct{
   
    var category : Category
    var id : NSManagedObjectID {
        return category.objectID
    }
    
    var name : String {
        return category.name!
    }
    
    var type : String {
        return category.type!
    }
}
