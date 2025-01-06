//
//  Item.swift
//  VaporTodo
//
//  Created by Brandon Jones on 1/6/25.
//
import Foundation

final class TodoItem: Codable, Identifiable {
    var id: UUID
    var title: String
    var isCompleted: Bool
//    var dueDate: Date
    var priority: Int
//    var createdAt: Date
//    var updatedAt: Date

    init(id: UUID = UUID(), title: String, isCompleted: Bool = false, priority: Int
         
//         createdAt: Date = Date(), updatedAt: Date = Date()
    )
  
  {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
//        self.dueDate = dueDate
        self.priority = priority
//        self.createdAt = createdAt
//        self.updatedAt = updatedAt
    }
}

//extension TodoItem {
//    static var mockData: [TodoItem] {
//        [
//            TodoItem(title: "Buy groceries", isCompleted: false, dueDate: Date().addingTimeInterval(86400 * 3), priority: 1, createdAt: Date(), updatedAt: Date()),
//            TodoItem(title: "Buy groceries", isCompleted: false, dueDate: Date().addingTimeInterval(86400 * 3), priority: 1, createdAt: Date(), updatedAt: Date()),
//            TodoItem(title: "Finish work project", isCompleted: true, dueDate: Date().addingTimeInterval(-86400), priority: 3, createdAt: Date().addingTimeInterval(-86400 * 2), updatedAt: Date().addingTimeInterval(-86400 * 2)),
//            TodoItem(title: "Call the dentist", isCompleted: false, dueDate: Date().addingTimeInterval(86400 * 14), priority: 2, createdAt: Date().addingTimeInterval(-86400 * 5), updatedAt: Date().addingTimeInterval(-86400 * 5)),
//            TodoItem(title: "Book flight tickets", isCompleted: false, dueDate: Date().addingTimeInterval(86400 * 60), priority: 2, createdAt: Date().addingTimeInterval(-86400 * 10), updatedAt: Date().addingTimeInterval(-86400 * 10)),
//            TodoItem(title: "Pay bills", isCompleted: false, dueDate: Date().addingTimeInterval(86400 * 2), priority: 3, createdAt: Date().addingTimeInterval(-86400), updatedAt: Date().addingTimeInterval(-86400)),
//        ]
//    }
//}
//extension TodoItem {
//    static var mockData: [TodoItem] {
//        [
//            TodoItem(title: "Buy groceries", isCompleted: false, dueDate: Date().addingTimeInterval(86400 * 3), priority: 1),
//            TodoItem(title: "Finish work project", isCompleted: true, dueDate: Date().addingTimeInterval(-86400), priority: 3),
//            TodoItem(title: "Call the dentist", isCompleted: false, dueDate: Date().addingTimeInterval(86400 * 14), priority: 2),
//            TodoItem(title: "Book flight tickets", isCompleted: false, dueDate: Date().addingTimeInterval(86400 * 60), priority: 2),
//            TodoItem(title: "Pay bills", isCompleted: false, dueDate: Date().addingTimeInterval(86400 * 2), priority: 3),
//        ]
//    }
//}


extension TodoItem {
    static var mockData: [TodoItem] {
        [
            TodoItem(title: "Buy groceries", isCompleted: false, priority: 1),
            TodoItem(title: "Finish work project", isCompleted: true, priority: 3),
            TodoItem(title: "Call the dentist", isCompleted: false, priority: 2),
            TodoItem(title: "Book flight tickets", isCompleted: false, priority: 2),
            TodoItem(title: "Pay bills", isCompleted: false, priority: 3),
        ]
    }
}
