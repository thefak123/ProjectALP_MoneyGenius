//
//  Header.swift
//  ProjectALP_MoneyGenius
//
//  Created by MacBook Pro on 28/05/23.
//

import SwiftUI

struct Header: View {
    @AppStorage("rValue") var rValue = Profile.rValue
    @AppStorage("gValue") var gValue = Profile.gValue
    @AppStorage("bValue") var bValue = Profile.bValue
    
    var body: some View {
        ZStack(alignment: .top) {
            Rectangle()
                .foregroundColor(Color(red: rValue, green: gValue, blue: bValue, opacity: 1.0))
                .edgesIgnoringSafeArea(.top)
                .frame(height: 100)
            Image("profile")
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                .shadow(radius: 10)
        }
    }
}
