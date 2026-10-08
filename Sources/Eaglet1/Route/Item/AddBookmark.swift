//
//  AddBookmark.swift
//  SwiftKnowledge
//
//  Created by Martônio Júnior on 14/04/25.
//

public struct AddBookmark {
    var url: String
    var name: String
    var base64: String?
    var tags: [String]?
    var modificationTime: Int?
    var folderID: Int?
    // var folderIds: [Int]
    // var star
}

// MARK: Self: Codable
extension AddBookmark: Codable {}

// MARK: Self: Equatable
extension AddBookmark: Equatable {}

// MARK: Self: Sendable
extension AddBookmark: Sendable {}
