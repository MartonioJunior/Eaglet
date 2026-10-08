//
//  AddURLItem.swift
//  SwiftKnowledge
//
//  Created by Martônio Júnior on 14/04/25.
//

public struct AddURLItem {
    var url: String
    var name: String
    var website: String?
    var tags: [String]?
    var star: Int?
    var annotation: String?
    var modificationTime: Int?
    var folderID: EagleFolder.ID?
}

// MARK: Self: Codable
extension AddURLItem: Codable {}

// MARK: Self: Equatable
extension AddURLItem: Equatable {}

// MARK: Self: Sendable
extension AddURLItem: Sendable {}
