//
//  NewItemViewModel.swift
//  MyTodoApp
//
//  Created by Michael on 23.10.23.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class NewItemViewModel: ObservableObject{
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert = false
    
    init(){}
    
    func save() {
        guard canSave else {
            return
        }
        
        guard let userId = Auth.auth().currentUser?.uid else {
            return
        }
        
        let newId = UUID().uuidString
        
        let newItem = ToDoListItem(
            id: newId,
            title: title,
            dueDate: dueDate.timeIntervalSince1970,
            createdDate: Date().timeIntervalSince1970,
            isDone: false
        )
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(newId)
            .setData(newItem.asDictionary())
        
        
        
    }
    
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            return false
        }
        
        guard dueDate >= Date().addingTimeInterval(-86400) else {
            return false
        }
        
        return true
    }
}
