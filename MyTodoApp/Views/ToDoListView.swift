//
//  ToDoListItemsView.swift
//  MyTodoApp
//
//  Created by Michael on 23.10.23.
//

import FirebaseFirestoreSwift
import SwiftUI

struct ToDoListView: View {
    
    @StateObject var viewModel : ToDoListViewModel
    @FirestoreQuery var items: [ToDoListItem]
    
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
        self._items = FirestoreQuery(
            collectionPath: "users/\(userId)/todos"
        )
        self._viewModel = StateObject(wrappedValue: ToDoListViewModel(userId: userId))
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(items) { item in
                    TodoListItemView(item: item)
                        .swipeActions {
                            Button("Delete"){
                                viewModel.delete(id: item.id)
                            }
                            .tint(.red)
                        }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("To Do List")
            .toolbar(content: {
                Button(action: {
                    viewModel.showNewItemView = true
                }, label: {
                    Image(systemName: "plus")
                })
            })
            .sheet(isPresented: $viewModel.showNewItemView, content: {
                NewItemView(newItemPresented: $viewModel.showNewItemView)
            })
        }
    }
}

#Preview {
    ToDoListView(userId: "L8W02fWDq7dwGSGpeQEfTT4vMcn2")
}
