//
//  ToDoListViewModel.swift
//  MyTodoApp
//
//  Created by Michael on 23.10.23.
//

import Foundation
import FirebaseFirestore

class ToDoListViewModel: ObservableObject{
    @Published var showNewItemView = false
    
    private let userId: String
    
    init(userId: String){
        self.userId = userId
    }
    
    func delete(id: String) {
        let db = Firestore.firestore()
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    }
}
