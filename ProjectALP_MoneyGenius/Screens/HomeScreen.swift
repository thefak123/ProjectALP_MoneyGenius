//
//  HomeScreen.swift
//  ProjectALP_MoneyGenius
//
//  Created by MacBook Pro on 18/05/23.
//

import SwiftUI
struct HomeScreen: View {
    @State private var selectedTab: Tab? = .home
    
    enum Tab {
        case home
        case statistics
        case profile
    }
    
    var body: some View {
        #if os(iOS)
        TabView(selection: $selectedTab) {
            MainScreen()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
                .tag(Tab.home)
            
            StatisticsScreen()
                .tabItem {
                    Image(systemName: "chart.pie")
                    Text("Statistics")
                }
                .tag(Tab.statistics)
            
            ProfileScreen()
                .tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("Profile")
                }
                .tag(Tab.profile)
        }
        #else
        NavigationView {
            List(selection: $selectedTab) {
                NavigationLink(destination: MainScreen(), tag: Tab.home, selection: $selectedTab) {
                    Label("Home", systemImage: "house.fill")
                }
                NavigationLink(destination: StatisticsScreen(), tag: Tab.statistics, selection: $selectedTab) {
                    Label("Statistics", systemImage: "chart.pie")
                }
                NavigationLink(destination: ProfileScreen(), tag: Tab.profile, selection: $selectedTab) {
                    Label("Profile", systemImage: "person.crop.circle")
                }
            }
            .listStyle(SidebarListStyle())
            .frame(minWidth: 200, idealWidth: 250, maxWidth: 300)
            .accentColor(Color.blue) // Customize the sidebar color
            
            content
        }
        .navigationTitle("Money Genius")

        #endif
    }
    
    @ViewBuilder
    var content: some View {
        if let selectedTab = selectedTab {
            switch selectedTab {
            case .home:
                MainScreen()
            case .statistics:
                StatisticsScreen()
            case .profile:
                ProfileScreen()
            }
        } else {
            Text("Select a tab")
        }
    }
}



struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HomeScreen()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
        }
    }
}
