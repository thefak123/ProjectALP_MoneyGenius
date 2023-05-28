//
//  ProfileScreen.swift
//  ProjectALP_MoneyGenius
//
//  Created by MacBook Pro on 18/05/23.
//

import SwiftUI

struct ProfileScreen: View {
    @State var isPresented = false

    var body: some View {
        VStack {
            VStack {
                Header()
                ProfileText()
            }
            Spacer()
            Button (
                action: { self.isPresented = true },
                label: {
                    Label("Edit", systemImage: "pencil")
            })
            .sheet(isPresented: $isPresented, content: {
                ProfileSettView()
            })
        }
    }
}

struct ProfileText: View {
    @AppStorage("name") var name = Profile.name
    @AppStorage("subtitle") var subtitle = Profile.subtitle
    @AppStorage("description") var description = Profile.description
    
    var body: some View {
        VStack(spacing: 15) {
            VStack(spacing: 5) {
                Text(name)
                    .bold()
                    .font(.title)
                Text(subtitle)
                    .font(.body)
                    .foregroundColor(.secondary)
            }.padding()
            Text(description)
                .multilineTextAlignment(.center)
                .padding()
            Spacer()
        }
    }
}


struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ProfileScreen()
    }
}

