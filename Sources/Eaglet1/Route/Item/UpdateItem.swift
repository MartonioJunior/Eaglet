//
//  UpdateItem.swift
//  SwiftKnowledge
//
//  Created by Martônio Júnior on 14/04/25.
//

/// Data structure with the necessary information to update an item in an Eagle Library.
public struct UpdateItem {
    /// ID of the item to be modified.
    var id: Int
    /// If this parameter is defined, updates an item's tags.
    var tags: [String]?
    /// If this parameter is defined, updates an item's annotation.
    var annotation: String?
    /// If this parameter is defined, updates an item's URL.
    var url: String?
    /// If this parameter is defined, updates an item's star rating.
    var star: Int?
}

// MARK: Self: Codable
extension UpdateItem: Codable {}

// MARK: Self: Equatable
extension UpdateItem: Equatable {}

// MARK: Self: Sendable
extension UpdateItem: Sendable {}
