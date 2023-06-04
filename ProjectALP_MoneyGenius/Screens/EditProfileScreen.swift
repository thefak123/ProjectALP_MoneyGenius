//
//  EditProfileScreen.swift
//  ProjectALP_MoneyGenius
//
//  Created by MacBook Pro on 04/06/23.
//

import SwiftUI

struct EditProfileScreen: View {
    @StateObject var viewModel = EditProfileViewModel()
    @State var showSheet = false
    @Binding var path : NavigationPath
    var body: some View {
        
        VStack{
            
            
            ZStack(alignment: .bottomTrailing) {
                Image(uiImage: viewModel.image)
                    .resizable()
                    .cornerRadius(50)
                    .frame(width: 150, height: 150)
                    .background(Color.black.opacity(0.2))
                    .aspectRatio(contentMode: .fill)
                    .clipShape(Circle())
                
                Button(action: {
                    showSheet = true
                    viewModel.isUpdatingImage = true
                }) {
                    Image(systemName: "plus")
                        .font(.largeTitle)
                        .frame(width: 20, height: 20)
                        .foregroundColor(.white)
                        .padding(20)
                        .background(Color.blue)
                        .clipShape(Circle())
                }
            }
            
            TextInputComponent(label: "Name", placeholder: "Input Name", hideLabel: true, value: $viewModel.name)
            Button(action: {
                viewModel.setInputProfile()
                path.removeLast()
                
            }){
                Text("Set Profile").frame(width: 150 , height: 50, alignment: .center)
            }.buttonStyle(.borderedProminent).frame(maxWidth: .infinity, alignment: .center).padding(.top, 30)
            Spacer()
        }.sheet(isPresented: $showSheet) {
            
            ImagePicker(sourceType: .photoLibrary, selectedImage: $viewModel.image)
            
            
        }.onChange(of: viewModel.image) {
            if $0 != nil {
                viewModel.isUpdatingImage = true
            }
        }.padding(30).onAppear{
            viewModel.getCurrentUser()
            
        }
    }
        
}


