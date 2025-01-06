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

    // ... add other methods for creating, updating, deleting todos
}
