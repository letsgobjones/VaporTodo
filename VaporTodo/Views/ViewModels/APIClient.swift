//
//  APIClient.swift
//  VaporTodo
//
//  Created by Brandon Jones on 1/6/25.
//



import Foundation

struct APIClient {
    let baseURL = URL(string: "http://127.0.0.1:8080")! // Replace with your server address

    enum APIError: Error {
        case invalidURL
        case requestFailed
        case decodingError
      case encodingError
    }

  func fetchTodos() async throws -> [TodoItem] {
        guard let url = URL(string: "todos", relativeTo: baseURL) else {
            throw APIError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)

        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw APIError.requestFailed
        }

        do {
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601 // If your dates are in ISO8601 format
            return try decoder.decode([TodoItem].self, from: data)
        } catch {
            throw APIError.decodingError
        }
    }
  
  
  
  func createTodo(title: String, isCompleted: Bool, dueDate: Date, priority: Int) async throws -> TodoItem {
          guard let url = URL(string: "todos", relativeTo: baseURL) else {
              throw APIError.invalidURL
          }

          // Create the request body (JSON encoding)
          let newTodo = TodoItem(title: title, isCompleted: isCompleted, priority: priority)
          guard let jsonData = try? JSONEncoder().encode(newTodo) else {
              throw APIError.encodingError
          }

          var request = URLRequest(url: url)
          request.httpMethod = "POST"
          request.httpBody = jsonData
          request.addValue("application/json", forHTTPHeaderField: "Content-Type")

          let (data, response) = try await URLSession.shared.data(for: request)

          guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
              throw APIError.requestFailed
          }

          return try JSONDecoder().decode(TodoItem.self, from: data)
      }
  
  
  
  
  
  
  
  

  func deleteTodo(withID id: UUID) async throws {
          guard let url = URL(string: "todos/\(id)", relativeTo: baseURL) else {
              throw APIError.invalidURL
          }

          var request = URLRequest(url: url)
          request.httpMethod = "DELETE"

          let (_, response) = try await URLSession.shared.data(for: request)

          guard let response = response as? HTTPURLResponse, response.statusCode == 204 else { // 204 No Content for successful delete
              throw APIError.requestFailed
          }
      }
}
