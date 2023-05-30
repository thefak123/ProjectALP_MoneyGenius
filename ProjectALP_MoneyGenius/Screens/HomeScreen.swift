//
//  HomeScreen.swift
//  ProjectALP_MoneyGenius
//
//  Created by MacBook Pro on 18/05/23.
//

import SwiftUI
struct HomeScreen: View {
    @State private var selectedTab: Tab? = .home
    @State private var initialSelection: Tab? = .home
       
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
                   List {
                       TabButton(title: "Home", imageName: "house.fill", tab: .home, selectedTab: $selectedTab)
                       TabButton(title: "Statistics", imageName: "chart.pie", tab: .statistics, selectedTab: $selectedTab)
                       TabButton(title: "Profile", imageName: "person.crop.circle", tab: .profile, selectedTab: $selectedTab)
                   }
                   .listStyle(SidebarListStyle())
                   .accentColor(Color(hex: "031C77"))
                   .background(Color(hex: "031C77"))
                   .navigationTitle("Money Genius")
                   .onAppear {
                       DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                           selectedTab = initialSelection
                       }
                   }

                   content
               }
        

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
    struct TabButton: View {
        let title: String
        let imageName: String
        let tab: HomeScreen.Tab
        @Binding var selectedTab: HomeScreen.Tab?

        var body: some View {
            Button(action: {
                selectedTab = tab
            }) {
                VStack(spacing: 0) {
                    ZStack(alignment: .leading) {
                        if selectedTab == tab {
                            RoundedRectangle(cornerRadius: 8)
                                .foregroundColor(.white)
                                .frame(height: 24)
                                .alignmentGuide(.leading, computeValue: { _ in 0 })
                        }
                        RoundedRectangle(cornerRadius: 8)
                            .fill(selectedTab == tab ? Color.white : Color(hex: "031C77"))
                            .frame(height: 24)
                            .opacity(selectedTab != tab ? 0 : 1)
                            .alignmentGuide(.leading, computeValue: { _ in 0 })
                        Label(title, systemImage: imageName)
                            .padding(.leading, 10)
                            .alignmentGuide(.leading, computeValue: { _ in 0 })
                    }
                    .overlay(
                        Rectangle()
                            .fill(Color.clear)
                            .contentShape(Rectangle())
                    )
                }
            }
            .buttonStyle(PlainButtonStyle())
            .foregroundColor(selectedTab == tab ? .black : .primary)
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
