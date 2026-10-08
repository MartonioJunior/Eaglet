//
//  MoveToTrash.swift
//  SwiftKnowledge
//
//  Created by Martônio Júnior on 14/04/25.
//

/// Data structure with the necessary information to move items in an Eagle Library
/// to it's trash bin.
/// 
/// This does not delete the items from the library, just puts them into the bin.
public struct MoveToTrash {
    /// IDs of items to remove.
    var itemIds: [EagleFolder.ID]
}

// MARK: Self: Codable
extension MoveToTrash: Codable {}

// MARK: Self: Equatable
extension MoveToTrash: Equatable {}

// MARK: Self: Sendable
extension MoveToTrash: Sendable {}
