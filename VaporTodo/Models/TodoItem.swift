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
  var dueDate: Date?
  var priority: Int
  var timestamp: Date
  
  init(id: UUID = UUID(), title: String, isCompleted: Bool = false, dueDate: Date?, priority: Int,timestamp: Date) {
    self.id = id
    self.title = title
    self.isCompleted = isCompleted
    self.dueDate = dueDate
    self.priority = priority
    self.timestamp = timestamp
  }
}
