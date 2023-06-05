//
//  ProfileScreen.swift
//  ProjectALP_MoneyGenius
//
//  Created by MacBook Pro on 18/05/23.
//

import SwiftUI

struct ProfileScreen: View {
    @State var isPresented = false
    @StateObject var viewModel = ProfileViewModel()
    @State var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path:$path){
            VStack {
                VStack {
                    Image(uiImage: viewModel.image)
                        .resizable()
                        .cornerRadius(50)
                        .frame(width: 150, height: 150)
                        .background(Color.black.opacity(0.2))
                        .aspectRatio(contentMode: .fill)
                        .clipShape(Circle())
                    Text(viewModel.user?.name ?? "")
                    List{
                        HStack{
                            Text("Edit Profile").onTapGesture {
                                path.append(viewModel.user!)
                            }
                        }
                    }
                }.navigationDestination(for: UserStruct.self) { user in
                    EditProfileScreen(path: $path)
                }.onAppear{
                    viewModel.getUserProfile()
                }
                Spacer()
                
            }.padding(30)
        }.navigationBarHidden(true)

    }
}






struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ProfileScreen()
    }
}

