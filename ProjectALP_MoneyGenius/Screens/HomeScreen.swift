//
//  HomeScreen.swift
//  ProjectALP_MoneyGenius
//
//  Created by MacBook Pro on 18/05/23.
//

import SwiftUI

struct HomeScreen: View {
    var viewModel = MainViewModel()
    var body: some View {
        #if os(iOS)
            #if targetEnvironment(macCatalyst)
                NavigationView {
                      List {
                          NavigationLink {
                            MainScreen()
                          } label: {
                            Label("Home", systemImage: "house.fill")
                          }
                          NavigationLink {
                            StatisticsScreen()
                          } label: {
                            Label("Statistics", systemImage: "chart.pie")
                          }
                          NavigationLink {
                            ProfileScreen()
                          } label: {
                            Label("Profile", systemImage: "person.crop.circle")
                          }
                      }
                      .listStyle(SidebarListStyle())
                }
               
            #else
                if UIDevice.current.userInterfaceIdiom == .pad{
                    
                }else{
                    TabView{
                        MainScreen().tabItem{
                            Image(systemName: "house.fill")
                            Text("Home")
                        }
                        StatisticsScreen().tabItem{
                            Image(systemName: "chart.pie")
                            Text("Statistics")
                        }
                        ProfileScreen().tabItem{
                            Image(systemName:"person.crop.circle")
                            Text("Profile")
                        }
                    }.onAppear{
                        viewModel.setDefaultCategories()
                    }
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
