//
//  RefreshItem.swift
//  SwiftKnowledge
//
//  Created by Martônio Júnior on 16/04/25.
//

/// Data structure with the necessary information to refresh an item in an Eagle Library.
public struct RefreshItem {
    /// ID of the item to be refreshed.
    var id: String
}

// MARK: Self: Codable
extension RefreshItem: Codable {}

// MARK: Self: Equatable
extension RefreshItem: Equatable {}

// MARK: Self: Sendable
extension RefreshItem: Sendable {}
