//
//  HomeScreen.swift
//  ProjectALP_MoneyGenius
//
//  Created by MacBook Pro on 18/05/23.
//

import SwiftUI
struct HomeScreen: View {
    var viewModel = MainViewModel()
    
    @State private var selection: String? = "home"
    
    var body: some View {
        
        #if os(iOS)
        #if targetEnvironment(macCatalyst)
        ZStack{
            Color.white
            NavigationView {
                List(selection: $selection) {
                    NavigationLink(destination: MainScreen(), tag: "home", selection: $selection) {
                        Label("Home", systemImage: "house.fill")
                            .foregroundColor(selection != "home" ? Color.gray : Color.white)
                    }
                    .tag("home")
                    
                    NavigationLink(destination: StatisticsScreen(), tag: "statistics", selection: $selection) {
                        Label("Statistics", systemImage: "chart.pie")
                            .foregroundColor(selection != "statistics" ? Color.gray : Color.white)
                    }
                    .tag("statistics")
                    
                    NavigationLink(destination: ProfileScreen(), tag: "profile", selection: $selection) {
                        Label("Profile", systemImage: "person.crop.circle")
                            .foregroundColor(selection != "profile" ? Color.gray : Color.white)
                    }
                    .tag("profile")
                }
                .listStyle(SidebarListStyle())
                .navigationBarTitle("Money Genius")
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        VStack {
                            Text("Money Genius")
                                .foregroundColor(Color.white)
                                .bold()
                        }
                    }
                }
                .navigationBarTitleDisplayMode(.inline)
                .background(Color(hex: 0x031C77))
                
                MainScreen()
            }
        }



        #else
        TabView {
            MainScreen()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            
            StatisticsScreen()
                .tabItem {
                    Image(systemName: "chart.pie")
                    Text("Statistics")
                }
            
            ProfileScreen()
                .tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("Profile")
                }
        }
        .onAppear {
            viewModel.setDefaultCategories()
        }
        #endif
        #endif
    }
}



struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
