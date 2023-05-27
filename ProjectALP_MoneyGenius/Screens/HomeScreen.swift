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
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
