//
//  MainScreenBlock.swift
//  ProjectALP_MoneyGenius
//
//  Created by MacBook Pro on 30/05/23.
//

import SwiftUI

struct MainScreenBlock: View {
    var image : String
    var text : String
    var desc : String
    var systemName : Bool = false
    
    
    
    var body: some View {
        
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(Color.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.black.opacity(0.5), lineWidth: 1)
                    ).frame(width:156, height: 156)
                    
                
                VStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 8)
                            .foregroundColor(Color.blue.opacity(0.2)).frame(width: 48, height: 48)
                        
                        if systemName {
                            Image(systemName: image)
                                .resizable().frame(width: 24, height: 24)
                              
                        }else{
                            Image(image)
                                .resizable().frame(width: 24, height: 24)
                                
                        }
                    }
                    .padding(.top,4)
                    .padding(.leading,12)
                    .padding(.trailing,12)
                    
                    Text(text)
                        .font(.custom("Inter-SemiBold", size: 16))
                        .foregroundColor(.black)
                    
                    Text(desc)
                        .font(.custom("Inter-Medium", size: 12))
                        .foregroundColor(.gray)
                    
                }
                
            
            }
    }
}

struct MainScreenBlock_Previews: PreviewProvider {
    static var previews: some View {
        MainScreenBlock(image: "", text: "", desc: "")
    }
}
