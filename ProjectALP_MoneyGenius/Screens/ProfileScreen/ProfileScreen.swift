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
                CircleImage()
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
        VStack(spacing: 1) {
            VStack(spacing: 3) {
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

struct CircleImage: View {
    var body: some View {
        Image("logo")
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.gray, lineWidth: 4)
            }
            .shadow(radius: 7)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}


struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ProfileScreen()
    }
}

