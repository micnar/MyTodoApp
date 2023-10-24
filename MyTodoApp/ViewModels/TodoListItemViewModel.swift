//
//  TodoListItemViewModel.swift
//  MyTodoApp
//
//  Created by Michael on 23.10.23.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class TodoListItemViewModel: ObservableObject{
    init(){}
    
    func toggleIsDone(item: ToDoListItem) {
        var itemCopy = item
        itemCopy.toggleDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
    }
}
