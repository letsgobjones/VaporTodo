//
//  PreviewContainer.swift
//  VaporTodo
//
//  Created by Brandon Jones on 1/6/25.
//
//
//import SwiftUI
//import SwiftData
//
//struct PreviewContainer {
//    static var shared: ModelContainer = {
//        let schema = Schema([
//            TodoItem.self,
//        ])
//        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: true)
//        do {
//            let container = try ModelContainer(for: schema, configurations: modelConfiguration)
//            return container
//        } catch {
//            fatalError("Could not create ModelContainer: \(error)")
//        }
//    }()
//}
