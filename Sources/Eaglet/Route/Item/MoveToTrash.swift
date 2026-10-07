//
//  MoveToTrash.swift
//  SwiftKnowledge
//
//  Created by Martônio Júnior on 14/04/25.
//

public struct MoveToTrash {
    var itemIds: [EagleFolder.ID]
}

// MARK: Self: Codable
extension MoveToTrash: Codable {}

// MARK: Self: Equatable
extension MoveToTrash: Equatable {}

// MARK: Self: Sendable
extension MoveToTrash: Sendable {}