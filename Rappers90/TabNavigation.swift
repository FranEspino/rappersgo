//
//  Home.swift
//  Rappers90
//
//  Created by vespro on 15/06/23.
//

import SwiftUI

struct TabNavigation: View {
    @State var tabSelected: Int = 2
    init(){
        UITabBar.appearance().backgroundColor = UIColor(Color("colorPrimary"))
        UITabBar.appearance().unselectedItemTintColor =
        UIColor(.gray)
        UITabBar.appearance().isTranslucent = true
        print("Init the Tab NavigationView")
    }
    
    var body: some View {
        TabView(selection: $tabSelected){
            Text("Pantalla Perfil")
                .font(  .system(size: 30, weight: .bold, design: .rounded))
                .tabItem{
                    Image(systemName: "person")
                    Text("Perfil")
                }.tag(0)
            
           RappersView()
                .tabItem{
                    Image(systemName: "headphones")
                    Text("Rappers")
                }.tag(1)
            
            HomeView()
                .tabItem{
                    Image(systemName: "house")
                    Text("Home")
                }.tag(2)
            Text("Pantalla Favorites")
                .font(  .system(size: 30, weight: .bold, design: .rounded))
                .tabItem{
                    Image(systemName: "heart")
                    Text("Favorites")
                }.tag(3)
        }.accentColor(.black)
    }

}

struct TabNavigation_Previews: PreviewProvider {
    static var previews: some View {
        TabNavigation()
    }
}
