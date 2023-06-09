//
//  SplashScreen.swift
//  ProjectALP_MoneyGenius
//
//  Created by MacBook Pro on 18/05/23.
//

import SwiftUI



struct SplashScreen: View {
    var body: some View {
        ZStack {
            Rectangle()
                .ignoresSafeArea()
                .foregroundColor(.white)
            
            VStack {
                Image("logo")
                Text("Money Genius")
                    .font(.custom("Inter-Bold", size: 36))
                    .foregroundColor(Color(hex: 0xf004AAD))
            }
        }
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
