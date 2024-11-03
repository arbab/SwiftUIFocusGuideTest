//
//  RootView.swift
//  SwiftUIFocusGuideTest
//
//  Created by Arbab Nawaz on 11/3/24.
//
import SwiftUI

struct RootView: View {
    var body: some View {
        TabView {
            NavigationStack {
                List {
                    Text("Home Content")
                        .frame(height: 500)
                }
                .navigationTitle("Home Title")
            }
            .tabItem {
                Label("Home", systemImage: "house")
            }
            .toolbarBackground(

                // 1
                Color.yellow,
                // 2
                for: .tabBar)
            
            LoginForm()
                .tabItem {
                    Label("Login", systemImage: "book")
                }
            ContentView()
                .tabItem {
                    Label("Search", systemImage: "binoculars")
                }
            
            
            Text("Notification")
                .tabItem {
                    Label("Notification", systemImage: "bell")
                }
            Text("Settings")
                .tabItem {
                    Label("Settings", systemImage: "gearshape")
                }
        }
    }
}
