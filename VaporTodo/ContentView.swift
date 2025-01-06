//
//  ContentView.swift
//  VaporTodo
//
//  Created by Brandon Jones on 1/6/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var todo: [TodoItem]

  @State var title: String = ""
  @State var dueDate: Date = Date().addingTimeInterval(604800)
  @State var isCompleted: Bool = false
  @State var priority: Int = 0
    var body: some View {
            List {
                ForEach(todo) { item in
                    NavigationLink {
                        Text("Item at \(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
                    } label: {
                        Text(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                  NavigationLink(destination: AddTodoView()) {
                    Label("Add Item", systemImage: "plus")
                  }
                  
                  
//                    Button(action: addItem) {
//                        Label("Add Item", systemImage: "plus")
//                    }
                  
                  
                  
                }
            }
        
    }

    private func addItem() {
        withAnimation {
          let newItem = TodoItem(title: title, isCompleted: isCompleted, dueDate: dueDate, priority: priority,timestamp: Date())
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(todo[index])
            }
        }
    }
}

#Preview {
  NavigationStack {
    ContentView()
    //      .modelContainer(for: TodoItem.self, inMemory: true)
  }
  .modelContainer(PreviewContainer.shared)
  
}
