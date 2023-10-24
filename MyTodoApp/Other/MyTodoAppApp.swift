//
//  MyTodoAppApp.swift
//  MyTodoApp
//
//  Created by Michael on 23.10.23.
//

import FirebaseCore
import SwiftUI

@main
struct MyTodoAppApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
