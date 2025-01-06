//
//  TodoDetailView.swift
//  VaporTodo
//
//  Created by Brandon Jones on 1/6/25.
//

import SwiftUI

struct TodoDetailView: View {
  var todo: TodoItem
  
    var body: some View {
      Text(todo.title)
      Text("Due Date")
//      Text(todo.dueDate, format: Date.FormatStyle(date: .numeric, time: .standard))
      Text("\(todo.priority)")
      Text("\(todo.isCompleted)")
      Text("Timestamp")
//      Text(todo.createdAt, format: Date.FormatStyle(date: .numeric, time: .standard))

    }
}

#Preview {
//  TodoDetailView(todo: TodoItem.mockData.first!)
  TodoDetailView(todo: TodoItem.mockData.first!)
}
