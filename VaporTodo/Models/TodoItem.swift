//
//  Item.swift
//  VaporTodo
//
//  Created by Brandon Jones on 1/6/25.
//

import Foundation
import SwiftData

@Model
final class TodoItem {
  var id: UUID
  var title: String
  var isCompleted: Bool
  var dueDate: Date
  var priority: Int
  var timestamp: Date
  
  init(id: UUID = UUID(), title: String, isCompleted: Bool = false, dueDate: Date = Date().addingTimeInterval(604800), priority: Int,timestamp: Date) {
    self.id = id
    self.title = title
    self.isCompleted = isCompleted
    self.dueDate = dueDate
    self.priority = priority
    self.timestamp = timestamp
  }
}

extension TodoItem {
    static var mockData: [TodoItem] {
        [
            TodoItem(title: "Buy groceries", isCompleted: false, dueDate: Date().addingTimeInterval(86400 * 3), priority: 1, timestamp: Date()), // Due in 3 days
            TodoItem(title: "Finish work project", isCompleted: true, dueDate: Date().addingTimeInterval(-86400), priority: 3, timestamp: Date().addingTimeInterval(-86400 * 2)), // Due yesterday
            TodoItem(title: "Call the dentist", isCompleted: false, dueDate: Date().addingTimeInterval(86400 * 14), priority: 2, timestamp: Date().addingTimeInterval(-86400 * 5)), // Due in 2 weeks
            TodoItem(title: "Book flight tickets", isCompleted: false, dueDate: Date().addingTimeInterval(86400 * 60), priority: 2, timestamp: Date().addingTimeInterval(-86400 * 10)), // Due in 2 months
            TodoItem(title: "Pay bills", isCompleted: false, dueDate: Date().addingTimeInterval(86400 * 2), priority: 3, timestamp: Date().addingTimeInterval(-86400)), // Due tomorrow
        ]
    }
}
