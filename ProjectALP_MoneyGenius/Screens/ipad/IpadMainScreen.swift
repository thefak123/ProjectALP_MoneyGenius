//
//  IpadMainScreen.swift
//  ProjectALP_MoneyGenius
//
//  Created by MacBook Pro on 02/06/23.
//

import SwiftUI

struct IpadMainScreen: View {
    var body: some View {
        NavigationStack {
            VStack(spacing:0){
                HStack {
                    CImage(image: Image("Ellipse"))
                        .frame(width: 80, height: 80)
                    
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
                    
                    Image("Card")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 800, height: 200)
                        .padding(.top,176)
                    
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
                    .padding(.top,16)
                    .padding(.leading,-280)
                    
                    
                }
                VStack(spacing: 16){
                    HStack(spacing: 16){
                        Button(action: {
                            // Action for the first button
                        }) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 20)
                                    .foregroundColor(Color.white)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 20)
                                            .stroke(Color.black.opacity(0.5), lineWidth: 1)
                                    )
                                    .frame(width:240, height: 240)
                                
                                VStack {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 8)
                                            .foregroundColor(Color.blue.opacity(0.2))
                                            .frame(width: 80, height: 80)
                                        Image("Send")
                                            .resizable()
                                            .frame(width: 32, height: 32)
                                    }
                                    .padding(.top,4)
                                    .padding(.leading,12)
                                    .padding(.trailing,12)
                                    
                                    Text("Transactions")
                                        .font(.custom("Inter-SemiBold", size: 24))
                                        .foregroundColor(.black)
                                    
                                    Text("Income & Outcome")
                                        .font(.custom("Inter-Medium", size: 20))
                                        .foregroundColor(.gray)
                                    
                                }
                                
                            }
                        }
                        
                        
                        Button(action: {
                            // Action for the second button
                        }) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 20)
                                    .foregroundColor(Color.white)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 20)
                                            .stroke(Color.black.opacity(0.5), lineWidth: 1)
                                    )
                                    .frame(width:240, height: 240)
                                
                                VStack {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 8)
                                            .foregroundColor(Color.blue.opacity(0.2))
                                            .frame(width: 80, height: 80)
                                        Image("Wallet")
                                            .resizable()
                                            .frame(width: 32, height: 32)
                                    }
                                    .padding(.top,4)
                                    .padding(.leading,12)
                                    .padding(.trailing,12)
                                    
                                    Text("Goals")
                                        .font(.custom("Inter-SemiBold", size: 24))
                                        .foregroundColor(.black)
                                    
                                    Text("Your Goals")
                                        .font(.custom("Inter-Medium", size: 20))
                                        .foregroundColor(.gray)
                                }
                            }
                        }
                    }
                    
                    HStack(spacing:48) {
                        Button(action: {
                            // Action for the third button
                        }) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 20)
                                    .foregroundColor(Color.white)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 20)
                                            .stroke(Color.black.opacity(0.5), lineWidth: 1)
                                    )
                                    .frame(width:240, height: 240)
                                
                                VStack {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 8)
                                            .foregroundColor(Color.blue.opacity(0.2))
                                            .frame(width: 80, height: 80)
                                        Image("3 User")
                                            .resizable()
                                            .frame(width: 32, height: 32)
                                    }
                                    .padding(.top,4)
                                    .padding(.leading,12)
                                    .padding(.trailing,12)
                                    Text("Reminder")
                                        .font(.custom("Inter-SemiBold", size: 24))
                                        .foregroundColor(.black)
                                    
                                    Text("Set Your Reminder")
                                        .font(.custom("Inter-Medium", size: 20))
                                        .foregroundColor(.gray)
                                }
                            }
                        }
                        Button(action: {
                            // Action for the third button
                        }) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 20)
                                    .foregroundColor(Color.white)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 20)
                                            .stroke(Color.black.opacity(0.5), lineWidth: 1)
                                    )
                                    .frame(width:240, height: 240)
                                
                                VStack {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 8)
                                            .foregroundColor(Color.blue.opacity(0.2))
                                            .frame(width: 80, height: 80)
                                        Image("Dolar")
                                            .resizable()
                                            .frame(width: 32, height: 32)
                                    }
                                    .padding(.top,4)
                                    .padding(.leading,12)
                                    .padding(.trailing,12)
                                    Text("Set Budget")
                                        .font(.custom("Inter-SemiBold", size: 24))
                                        .foregroundColor(.black)
                                    
                                    Text("Set Your Budget")
                                        .font(.custom("Inter-Medium", size: 20))
                                        .foregroundColor(.gray)
                                }
                            }
                        }
                        
                    }
                }
                .padding(.top,36)
                
                
                
                
                
            }
            Spacer()
        }
    }
}

struct IpadMainScreen_Previews: PreviewProvider {
    static var previews: some View {
        IpadMainScreen()
    }
}
