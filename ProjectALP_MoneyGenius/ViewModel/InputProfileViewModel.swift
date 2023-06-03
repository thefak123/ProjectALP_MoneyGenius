//
//  InputProfileViewModel.swift
//  ProjectALP_MoneyGenius
//
//  Created by MacBook Pro on 03/06/23.
//

import Foundation
import SwiftUI

class InputProfileViewModel : ObservableObject {
    @Published var name :  String = ""
    @Published var image = UIImage()
    @Published var isSaved : Bool = false
    
    let coreDataManager = CoreDataManager.shared
    
    func setInputProfile(){
        let imgName = UUID().uuidString
        saveImage(imageName: imgName, image: image)
        isSaved = coreDataManager.setUserProfile(username: name, image: imgName)
        if isSaved {
            print("Saved")
        }else{
            print("Failed")
        }
    }
    
    func getCurrentUser(){
        let users = coreDataManager.getCurrentUser().map(UserStruct.init)
        if users.count != 0 {
            name = users[0].name
            image = loadImageFromDiskWith(fileName:users[0].profileImage) ?? UIImage()
        }
    }
}


