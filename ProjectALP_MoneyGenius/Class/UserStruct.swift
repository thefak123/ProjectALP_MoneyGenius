//
//  UserStruct.swift
//  ProjectALP_MoneyGenius
//
//  Created by MacBook Pro on 03/06/23.
//

import Foundation
import CoreData

struct UserStruct{
   
    var user : User
    
    var id : NSManagedObjectID {
        return user.objectID
    }
    
    var name : String {
        return user.name ?? ""
    }
    var profileImage : String{
        return user.profileImage ?? ""
    }
    
   
}
