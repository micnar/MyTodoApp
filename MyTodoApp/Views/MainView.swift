//
//  ContentView.swift
//  MyTodoApp
//
//  Created by Michael on 23.10.23.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var viewModel = MainViewModel()
    
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
            TabView {
                ToDoListView(userId: viewModel.currentUserId)
                    .tabItem { Label("Home", systemImage: "house") }
                
                ProfileView()
                    .tabItem { Label("Profile", systemImage: "person.circle") }
            }
        } else {
            LoginView()
        }
    }
}

#Preview {
    MainView()
}
