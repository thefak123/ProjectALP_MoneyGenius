//
//  ProfileSettView.swift
//  ProjectALP_MoneyGenius
//
//  Created by MacBook Pro on 28/05/23.
//

import SwiftUI

struct ProfileSettView: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            Form {
                HeaderBackgroundSliders()
                ProfileSettings()
            }
            .navigationBarTitle(Text("Settings"))
            .navigationBarItems(
                trailing:
                    Button (
                        action: {
                            self.presentationMode.wrappedValue.dismiss()
                        },
                        label: {
                            Text("Done")
                        }
                    )
            )
        }
    }
}
struct ProfileSettings: View {
    @AppStorage("name") var name =
        Profile.name
    @AppStorage("subtitle") var subtitle = Profile.subtitle
    @AppStorage("description") var description =
    Profile.description
    
    var body: some View {
        Section(header: Text("Profile")) {
            Button (
                action: {
                    // Action
                },
                label: {
                    Text("Edit Profile Image")
                }
            )
            TextField("Name", text: $name)
            TextField("Subtitle", text: $subtitle)
            TextEditor(text: $description)
        }
    }
}

struct HeaderBackgroundSliders: View {
    @AppStorage("rValue") var rValue = Profile.rValue
    @AppStorage("gValue") var gValue = Profile.gValue
    @AppStorage("bValue") var bValue = Profile.bValue
    
    var body: some View {
        Section(header: Text("Header Background Color")) {
            HStack {
                VStack {
                    RoundedRectangle(cornerRadius: 5)
                        .frame(width: 100)
                        .foregroundColor(Color(red: rValue, green: gValue, blue: bValue, opacity: 1.0))
                }
                //                VStack {
                //                    Text("R: \(Int(rValue * 255.0))")
                //                    Text("G: \(Int(gValue * 255.0))")
                //                    Text("B: \(Int(bValue * 255.0))")
                //                }
                VStack {
                    colorSlider(value: $rValue, textColor: .red)
                    colorSlider(value: $gValue, textColor: .green)
                    colorSlider(value: $bValue, textColor: .blue)
                }
            }
        }
    }
    
    
    
    struct SettingsView_Previews: PreviewProvider {
        static var previews: some View {
            ProfileSettView()
        }
    }
}
