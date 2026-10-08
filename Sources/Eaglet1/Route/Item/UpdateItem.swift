//
//  UpdateItem.swift
//  SwiftKnowledge
//
//  Created by Martônio Júnior on 14/04/25.
//

public struct UpdateItem {
    var id: Int
    var tags: [String]?
    var annotation: String?
    var url: String?
    var star: Int?
}

// MARK: Self: Codable
extension UpdateItem: Codable {}

// MARK: Self: Equatable
extension UpdateItem: Equatable {}

// MARK: Self: Sendable
extension UpdateItem: Sendable {}
