//
//  InputProfileScreen.swift
//  ProjectALP_MoneyGenius
//
//  Created by MacBook Pro on 03/06/23.
//

import SwiftUI

struct InputProfileScreen: View {
    @StateObject var viewModel = UserViewModel()
    @State private var showSheet = false
    @State var tryToNavigate : Bool = false
    var body: some View {
        
        if !tryToNavigate{
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
                    }) {
                        Image(systemName: "plus")
                            .font(.largeTitle)
                            .frame(width: 15, height: 15)
                            .foregroundColor(.white)
                            .padding(10)
                            .background(Color.init(Theme.darkMainColor))
                            .clipShape(Circle())
                    }
                }.onAppear{
                    viewModel.getCurrentUser()
                }
                
                TextInputComponent(label: "Name", placeholder: "Input Name", hideLabel: true, value: $viewModel.name)
                Button(action: {
                    if viewModel.name != "" {
                        viewModel.addUserProfile()
                        if viewModel.isSaved{
                            tryToNavigate = true
                        }
                    }
                    
                }){
                    Text("Set Profile").frame(width: 150 , height: 50, alignment: .center).foregroundColor(.white)
                }.background(Color.init(Theme.darkMainColor)).frame(maxWidth: .infinity, alignment: .center).padding(.top, 30)
                Spacer()
            }.sheet(isPresented: $showSheet) {
                // Pick an image from the photo library:
                ImagePicker(sourceType: .photoLibrary, selectedImage: $viewModel.image)
                
                //  If you wish to take a photo from camera instead:
                // ImagePicker(sourceType: .camera, selectedImage: self.$image)
            }.padding(30).onAppear{
                viewModel.getCurrentUser()
                if viewModel.name != ""{
                    tryToNavigate = true
                }
            }
        }else{
            HomeScreen()
        }
        }
    
}

struct InputProfileScreen_Previews: PreviewProvider {
    static var previews: some View {
        InputProfileScreen()
    }
}
