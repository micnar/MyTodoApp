//
//  User.swift
//  MyTodoApp
//
//  Created by Michael on 23.10.23.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
