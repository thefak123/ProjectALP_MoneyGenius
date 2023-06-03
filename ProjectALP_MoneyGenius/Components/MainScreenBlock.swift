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
    @State var outer : CGFloat = 0
    @State var inner : CGFloat = 0
    @State var imgWidth : CGFloat = 0
    
    
    var body: some View {
        
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(Color.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.black.opacity(0.5), lineWidth: 1)
                    ).frame(width:outer, height: outer)
                    
                
                VStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 8)
                            .foregroundColor(Color.blue.opacity(0.2)).frame(width: inner, height: inner)
                        
                        if systemName {
                            Image(systemName: image)
                                .resizable().frame(width: imgWidth, height: imgWidth)
                              
                        }else{
                            Image(image)
                                .resizable().frame(width: imgWidth, height: imgWidth)
                                
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
                    
                }.onAppear{
                    #if os(iOS)
                                        
                    #endif
                                        
                    #if os(iOS)
                    #if targetEnvironment(macCatalyst)
                                        
                    #else
                        if UIDevice.current.userInterfaceIdiom == .pad{
                            self.outer = 200
                            self.inner = 90
                            self.imgWidth = 50
                        }else{
                            self.outer = 156
                            self.inner = 48
                            self.imgWidth = 24
                        }
                    #endif
                    #endif
                }
                
            
            }
    }
}

struct MainScreenBlock_Previews: PreviewProvider {
    static var previews: some View {
        MainScreenBlock(image: "", text: "", desc: "")
    }
}
