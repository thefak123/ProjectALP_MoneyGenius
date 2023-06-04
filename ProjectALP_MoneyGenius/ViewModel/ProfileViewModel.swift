//
//  ProfileViewModel.swift
//  ProjectALP_MoneyGenius
//
//  Created by MacBook Pro on 28/05/23.
//

import UIKit
import CoreData

class ProfileViewModel: ObservableObject {
    let coreDataManager = CoreDataManager.shared
    @Published var image = UIImage()
    @Published var user : UserStruct? = nil
    
    func getUserProfile(){
        user = coreDataManager.getCurrentUser().map(UserStruct.init)[0]
        image = loadImageFromDiskWith(fileName: user?.profileImage ?? "") ?? UIImage()
    }
    
    


   

}

