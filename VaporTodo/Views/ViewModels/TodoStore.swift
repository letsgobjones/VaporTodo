//
//  TodoStore.swift
//  VaporTodo
//
//  Created by Brandon Jones on 1/6/25.
//

import SwiftUI
// Create a ViewModel to handle data logic
class TodoStore: ObservableObject {
  
    @Published var todos: [TodoItem] = []
    let apiClient = APIClient()

    func fetchTodos() async {
        do {
            todos = try await apiClient.fetchTodos()
        } catch {
            print("Error fetching todos: \(error)")
            // Handle the error (e.g., display an error message)
        }
    }

  
  func createTodo(title: String, isCompleted: Bool, dueDate: Date, priority: Int) async {
          do {
              let newTodo = try await apiClient.createTodo(title: title, isCompleted: isCompleted, dueDate: dueDate, priority: priority)
              // Update the todos array in the TodoStore
              todos.append(newTodo)
          } catch {
              print("Error creating todo: \(error)")
              // Handle the error (e.g., display an error message)
          }
      }
  
  
    func deleteTodo(at offsets: IndexSet) {
        // Implement logic to delete todos from the server using apiClient
        // and update the todos array
    }
  
  
  
  
  
  
  
}
