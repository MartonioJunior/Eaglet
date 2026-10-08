//
//  UpdateFolder.swift
//  SwiftKnowledge
//
//  Created by Martônio Júnior on 14/04/25.
//

public struct UpdateFolder: Codable {
    var id: EagleFolder.ID
    var newName: String?
    var newDescription: String?
    var newColor: EagleFolder.Color?
}

// MARK: Self: Sendable
extension UpdateFolder: Sendable {}
