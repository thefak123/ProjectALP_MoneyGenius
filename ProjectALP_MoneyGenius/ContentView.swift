//
//  ContentView.swift
//  ProjectALP_MoneyGenius
//
//  Created by MacBook Pro on 16/05/23.
//

import SwiftUI
import CoreData


struct ContentView: View {
    @State var isActive : Bool = false
    var body: some View {
        ZStack{
            if self.isActive == true{
                HomeScreen()
            }else{
                SplashScreen()
                
            }
            
        }.onAppear {
            DispatchQueue
                .main
                .asyncAfter(deadline:
                        .now() + 3) {
                            self.isActive = true
                        }
        }
    }
  
}



//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
