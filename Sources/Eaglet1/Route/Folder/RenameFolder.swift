//
//  RenameFolder.swift
//  SwiftKnowledge
//
//  Created by Martônio Júnior on 14/04/25.
//

public struct RenameFolder: Codable {
    var id: EagleFolder.ID
    var newName: String
}

// MARK: Self: Sendable
extension RenameFolder: Sendable {}
