//
//  UserViewModel.swift
//  ProjectALP_MoneyGenius
//
//  Created by MacBook Pro on 06/06/23.
//


import UIKit
import CoreData

class UserViewModel: ObservableObject {
    let coreDataManager = CoreDataManager.shared
    @Published var image = UIImage()
    @Published var user : UserStruct? = nil
    @Published var name :  String = ""
    @Published var isSaved : Bool = false
    @Published var isUpdatingImage : Bool = false
    
    
    func getUserProfile(){
        user = coreDataManager.getCurrentUser().map(UserStruct.init)[0]
        image = loadImageFromDiskWith(fileName: user?.profileImage ?? "") ?? UIImage()
    }
    
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
    
    func addUserProfile(){
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
