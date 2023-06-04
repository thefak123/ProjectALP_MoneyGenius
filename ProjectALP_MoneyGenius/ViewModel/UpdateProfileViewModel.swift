//
//  UpdateProfileViewModel.swift
//  ProjectALP_MoneyGenius
//
//  Created by MacBook Pro on 04/06/23.
//

import Foundation
import SwiftUI

class EditProfileViewModel : ObservableObject {
    @Published var name :  String = ""
    @Published var image = UIImage()
    @Published var user : UserStruct? = nil
    @Published var isSaved : Bool = false
    @Published var isUpdatingImage : Bool = false
    
    let coreDataManager = CoreDataManager.shared
    
    func setInputProfile(){
        if isUpdatingImage{
            let imgName = UUID().uuidString
            saveImage(imageName: imgName, image: image)
            isSaved = coreDataManager.setUserProfile(username: name, image: imgName)
        }else{
            coreDataManager.setUserProfile(username: name, image: user?.profileImage ?? "")
            
        }
        
        
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
            user = users[0]
        }
    }
}
