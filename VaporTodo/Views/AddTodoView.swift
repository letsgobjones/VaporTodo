//
//  AddTodoView.swift
//  VaporTodo
//
//  Created by Brandon Jones on 1/6/25.
//

import SwiftUI

struct AddTodoView: View {
  @Environment(\.dismiss) private var dismiss
  @Environment(\.modelContext) private var modelContext

  @State var title: String = ""
  @State var dueDate: Date = Date().addingTimeInterval(604800)
  @State var isCompleted: Bool = false
  @State var priority: Int = 0
  
  
  
    var body: some View {
      Form {
        TextField("Title", text: $title)
        
        TextField("Priority", value: $priority, format: .number)
        
        DatePicker("Due Date", selection: $dueDate)
        Toggle("Completed", isOn: $isCompleted)
        
        
      }
      Button("Save") {
        addItem()
      }
    }
}

#Preview {
  NavigationStack {
    AddTodoView()
  }
      .modelContainer(PreviewContainer.shared)
}

extension AddTodoView {
  private func addItem() {
      withAnimation {
          let newItem = TodoItem(title: title, isCompleted: isCompleted, dueDate: dueDate, priority: priority,timestamp: Date())
          modelContext.insert(newItem)
        dismiss()
        print("Was saved")
        print(newItem)
      }
  }
}
