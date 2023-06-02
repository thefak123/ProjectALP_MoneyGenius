//
//  MacMainScreen.swift
//  ProjectALP_MoneyGenius
//
//  Created by MacBook Pro on 02/06/23.
//

import SwiftUI

struct MacMainScreen: View {
    var body: some View {
        NavigationStack {
            ZStack{
                Color.white.edgesIgnoringSafeArea(.all)
                VStack(spacing:0){
                    HStack {
                        CImage(image: Image("Ellipse"))
                            .frame(width: 64, height: 64)
                        
                        VStack(alignment: .leading) {
                            Text("Welcome back,")
                                .foregroundColor(.gray)
                                .font(.custom("Inter", size: 24))
                            Text("Bryan")
                                .foregroundColor(.black)
                                .font(.custom("Inter", size: 32))
                        }
                        .padding(.leading,8)
                        Spacer()
                        
                        
                    }
                    .padding(.horizontal, 80)
                    .padding(.top, 56)
                    
                    ZStack {
                        
                        Image("X-Card-3")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 800, height: 160)
                            .padding(.top,48)
                            .padding(.leading,48)
                        VStack(alignment: .leading){
                            Text("Balance")
                                .foregroundColor(.gray)
                                .font(.custom("Inter-Bold", size: 36))
                            
                            HStack {
                                Text("Rp")
                                    .foregroundColor(.white)
                                    .font(.custom("Inter", size: 40))
                                
                                Text("100000")
                                    .foregroundColor(.white)
                                    .font(.custom("Inter", size: 40))
                            }
                        }
                        .padding(.top,-16)
                        .padding(.leading,-308)
                        
                        
                    }
                    VStack(spacing: 32){
                        HStack(spacing: 32){
                            Button(action: {
                                // Action for the button
                            }) {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 20)
                                        .foregroundColor(Color.white)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 20)
                                                .stroke(Color.black.opacity(0.5), lineWidth: 1)
                                        )
                                        .frame(width: 200, height: 200)
                                    
                                    VStack {
                                        ZStack {
                                            RoundedRectangle(cornerRadius: 8)
                                                .foregroundColor(Color.blue.opacity(0.2))
                                                .frame(width: 88, height: 88)
                                            Image("Send")
                                                .resizable()
                                                .frame(width: 36, height: 36)
                                        }
                                        
                                        Text("Transactions")
                                            .font(.custom("Inter-SemiBold", size: 24))
                                            .foregroundColor(.black)
                                        
                                        Text("Income & Outcome")
                                            .font(.custom("Inter-Medium", size: 20))
                                            .foregroundColor(.gray)
                                        
                                    }
                                    .padding(.top, 8)
                                }
                            }
                            .buttonStyle(PlainButtonStyle())
                            
                            Button(action: {
                                // Action for the button
                            }) {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 20)
                                        .foregroundColor(Color.white)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 20)
                                                .stroke(Color.black.opacity(0.5), lineWidth: 1)
                                        )
                                        .frame(width: 200, height: 200)
                                    
                                    VStack {
                                        ZStack {
                                            RoundedRectangle(cornerRadius: 8)
                                                .foregroundColor(Color.blue.opacity(0.2))
                                                .frame(width: 88, height: 88)
                                            Image("Wallet")
                                                .resizable()
                                                .frame(width: 36, height: 36)
                                        }
                                        
                                        Text("Goals")
                                            .font(.custom("Inter-SemiBold", size: 24))
                                            .foregroundColor(.black)
                                        
                                        Text("Your Goals")
                                            .font(.custom("Inter-Medium", size: 20))
                                            .foregroundColor(.gray)
                                        
                                    }
                                    .padding(.top, 8)
                                }
                            }
                            .buttonStyle(PlainButtonStyle())
                            

                            
                        }
                        HStack(spacing: 32){
                            Button(action: {
                                // Action for the button
                            }) {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 20)
                                        .foregroundColor(Color.white)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 20)
                                                .stroke(Color.black.opacity(0.5), lineWidth: 1)
                                        )
                                        .frame(width: 200, height: 200)
                                    
                                    VStack {
                                        ZStack {
                                            RoundedRectangle(cornerRadius: 8)
                                                .foregroundColor(Color.blue.opacity(0.2))
                                                .frame(width: 88, height: 88)
                                            Image("3 User")
                                                .resizable()
                                                .frame(width: 36, height: 36)
                                        }
                                        
                                        Text("Reminder")
                                            .font(.custom("Inter-SemiBold", size: 24))
                                            .foregroundColor(.black)
                                        
                                        Text("Set Your Reminder")
                                            .font(.custom("Inter-Medium", size: 20))
                                            .foregroundColor(.gray)
                                        
                                    }
                                    .padding(.top, 8)
                                }
                            }
                            .buttonStyle(PlainButtonStyle())
                            
                            Button(action: {
                                // Action for the button
                            }) {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 20)
                                        .foregroundColor(Color.white)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 20)
                                                .stroke(Color.black.opacity(0.5), lineWidth: 1)
                                        )
                                        .frame(width: 200, height: 200)
                                    
                                    VStack {
                                        ZStack {
                                            RoundedRectangle(cornerRadius: 8)
                                                .foregroundColor(Color.blue.opacity(0.2))
                                                .frame(width: 88, height: 88)
                                            Image("Dolar")
                                                .resizable()
                                                .frame(width: 36, height: 36)
                                        }
                                        
                                        Text("Budget")
                                            .font(.custom("Inter-SemiBold", size: 24))
                                            .foregroundColor(.black)
                                        
                                        Text("Set Your Budget")
                                            .font(.custom("Inter-Medium", size: 20))
                                            .foregroundColor(.gray)
                                        
                                    }
                                    .padding(.top, 8)
                                }
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                    .padding(.bottom,32)
                    Spacer()
                    
                    
                    
                    
                    
                }
                
            }
        }
    }
}

struct MacMainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MacMainScreen()
    }
}
