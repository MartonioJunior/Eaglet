//
//  AddPathItem.swift
//  SwiftKnowledge
//
//  Created by Martônio Júnior on 14/04/25.
//

public struct AddPathItem {
    var path: String
    var name: String
    var website: String?
    var annotation: String?
    var tags: [String]?
    var folderID: EagleFolder.ID?
}

// MARK: Self: Codable
extension AddPathItem: Codable {}

// MARK: Self: Equatable
extension AddPathItem: Equatable {}

// MARK: Self: Sendable
extension AddPathItem: Sendable {}
