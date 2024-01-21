//
//  TodoListView.swift
//  emojis
//
//  Created by Wildan on 21/01/24.
//

import SwiftUI

let todoListData: [String] = ["Traveling","Drawing","Painting"]

struct TodoListView:View {
    @State var todoLists: [String] = todoListData
    @State var keyword: String = ""
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(todoLists, id:\.self){todo in
                    Text(todo)
                }
            }
            .navigationTitle("My Todo List")
            .searchable(text: $keyword)
            .onChange(of:keyword){ oldValue, newValue in
                let filteredTodoLists = todoLists.filter {
                    return $0.contains(newValue)
                }
                
                todoLists = filteredTodoLists
                
                if filteredTodoLists.isEmpty{
                    todoLists = todoListData
                }
            }
        }
    }
}

#Preview {
    TodoListView()
}
