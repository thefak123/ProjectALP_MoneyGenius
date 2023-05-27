//
//  MainScreen.swift
//  ProjectALP_MoneyGenius
//
//  Created by MacBook Pro on 18/05/23.
//

import SwiftUI

struct MainScreen: View {
    
    var body: some View {
#if os(iOS)
        if UIDevice.current.userInterfaceIdiom == .phone {
            NavigationStack {
                VStack(spacing:0){
                    HStack {
                        CircleImage(image: Image("Ellipse"))
                            .frame(width: 56, height: 56)
                        
                        VStack(alignment: .leading) {
                            Text("Welcome back,")
                                .foregroundColor(.gray)
                                .font(.custom("Inter", size: 12))
                            Text("Bryan")
                                .foregroundColor(.black)
                                .font(.custom("Inter", size: 18))
                        }
                        .padding(.leading,8)
                        Spacer()
                        
                        
                    }
                    .padding(.horizontal, 32)
                    
                    ZStack {
                        
                        Image("Card")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 400, height: 300)
                        
                        VStack(alignment: .leading){
                            Text("Balance")
                                .foregroundColor(.gray)
                                .font(.custom("Inter-Bold", size: 20))
                            
                            HStack {
                                Text("Rp")
                                    .foregroundColor(.white)
                                    .font(.custom("Inter", size: 24))
                                
                                Text("100000")
                                    .foregroundColor(.white)
                                    .font(.custom("Inter", size: 24))
                            }
                        }
                        .padding(.top,-64)
                        .padding(.leading,-120)
                        
                        
                    }
                    VStack {
                        HStack {
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
                                        .frame(width:156, height: 156)
                                    
                                    VStack {
                                        ZStack {
                                            RoundedRectangle(cornerRadius: 8)
                                                .foregroundColor(Color.blue.opacity(0.2))
                                                .frame(width: 48, height: 48)
                                            Image("Send")
                                                .resizable()
                                                .frame(width: 24, height: 24)
                                        }
                                        .padding(.top,4)
                                        .padding(.leading,12)
                                        .padding(.trailing,12)
                                        
                                        Text("Transactions")
                                            .font(.custom("Inter-SemiBold", size: 16))
                                            .foregroundColor(.black)
                                        
                                        Text("Income & Outcome")
                                            .font(.custom("Inter-Medium", size: 12))
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
                                        .frame(width:156, height: 156)
                                    
                                    VStack {
                                        ZStack {
                                            RoundedRectangle(cornerRadius: 8)
                                                .foregroundColor(Color.blue.opacity(0.2))
                                                .frame(width: 48, height: 48)
                                            Image("Wallet")
                                                .resizable()
                                                .frame(width: 24, height: 24)
                                        }
                                        .padding(.top,4)
                                        .padding(.leading,12)
                                        .padding(.trailing,12)
                                        
                                        Text("Goals")
                                            .font(.custom("Inter-SemiBold", size: 16))
                                            .foregroundColor(.black)
                                        
                                        Text("Your Goals")
                                            .font(.custom("Inter-Medium", size: 12))
                                            .foregroundColor(.gray)
                                    }
                                }
                            }
                        }
                        
                        HStack {
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
                                        .frame(width:156, height: 156)
                                    
                                    VStack {
                                        ZStack {
                                            RoundedRectangle(cornerRadius: 8)
                                                .foregroundColor(Color.blue.opacity(0.2))
                                                .frame(width: 48, height: 48)
                                            Image("3 User")
                                                .resizable()
                                                .frame(width: 24, height: 24)
                                        }
                                        .padding(.top,4)
                                        .padding(.leading,12)
                                        .padding(.trailing,12)
                                        Text("Reminder")
                                            .font(.custom("Inter-SemiBold", size: 16))
                                            .foregroundColor(.black)
                                        
                                        Text("Set Your Reminder")
                                            .font(.custom("Inter-Medium", size: 12))
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
                                        .frame(width:156, height: 156)
                                    
                                    VStack {
                                        ZStack {
                                            RoundedRectangle(cornerRadius: 8)
                                                .foregroundColor(Color.blue.opacity(0.2))
                                                .frame(width: 48, height: 48)
                                            Image("Dolar")
                                                .resizable()
                                                .frame(width: 24, height: 24)
                                        }
                                        .padding(.top,4)
                                        .padding(.leading,12)
                                        .padding(.trailing,12)
                                        Text("Set Budget")
                                            .font(.custom("Inter-SemiBold", size: 16))
                                            .foregroundColor(.black)
                                        
                                        Text("Set Your Budget")
                                            .font(.custom("Inter-Medium", size: 12))
                                            .foregroundColor(.gray)
                                    }
                                }
                            }
                            
                        }
                    }
                    .padding(.top,-80)
                    
                    
                    
                    
                    
                }
            }
        }
        else if UIDevice.current.userInterfaceIdiom == .pad {
            
            NavigationStack {
                VStack(spacing:0){
                    HStack {
                        CircleImage(image: Image("Ellipse"))
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
        
        #endif
                
        #if os(macOS)
        NavigationStack {
            ZStack{
                Color.white.edgesIgnoringSafeArea(.all)
                VStack(spacing:0){
                    HStack {
                        CircleImage(image: Image("Ellipse"))
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
        

        
            
            
            
            
        
        #endif
           
        
        
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MainScreen()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}
