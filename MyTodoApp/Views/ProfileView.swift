//
//  ProfileView.swift
//  MyTodoApp
//
//  Created by Michael on 23.10.23.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var viewModel = ProfileViewModel()
    var body: some View {
        NavigationView{
            VStack {
                
            }
            .navigationTitle("Profile")
        }
        
    }
}

#Preview {
    ProfileView()
}
