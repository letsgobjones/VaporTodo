//
//  ContentView.swift
//  VaporTodo
//
//  Created by Brandon Jones on 1/6/25.
//

import SwiftUI
//import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
//    @Query private var todo: [TodoItem]
  @ObservedObject var todoStore: TodoStore

  @State var title: String = ""
  @State var dueDate: Date = Date().addingTimeInterval(604800)
  @State var isCompleted: Bool = false
  @State var priority: Int = 0
    var body: some View {
            List {
              ForEach(todoStore.todos) { item in
                    NavigationLink {
//                        Text("Item at \(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
                      
                      TodoDetailView(todo: item)
                    } label: {
//                        Text(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))
                      Text(item.title)
                    }
                }
                .onDelete(perform: todoStore.deleteTodo)
            }
            .toolbar {
              ToolbarItem(placement: .navigationBarTrailing) {
                EditButton()
              }
              ToolbarItem {
                NavigationLink(destination: AddTodoView(todoStore: todoStore)) {
                  Label("Add Item", systemImage: "plus")
                }
                
                
                //                    Button(action: addItem) {
                //                        Label("Add Item", systemImage: "plus")
                //                    }
                
                
                
              }
            }.task {
              await todoStore.fetchTodos() // Fetch todos on appear
          }
        
    }


}

#Preview {
  NavigationStack {
    ContentView(todoStore: TodoStore())
    //      .modelContainer(for: TodoItem.self, inMemory: true)
  }
//  .modelContainer(PreviewContainer.shared)
  
}


//extension ContentView {
//  private func addItem() {
//      withAnimation {
//        let newItem = TodoItem(title: title, isCompleted: isCompleted, dueDate: dueDate, priority: priority,timestamp: Date())
//          modelContext.insert(newItem)
//      }
//  }
//
//  private func deleteItems(offsets: IndexSet) {
//      withAnimation {
//          for index in offsets {
//              modelContext.delete(todo[index])
//          }
//      }
//  }
//}
