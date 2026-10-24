//
//  AddTagsToTagGroup.swift
//  Eaglet
//
//  Created by Martônio Júnior on 21/10/2026.
//

public import EagletCore

public struct AddTagsToTagGroup {
    var groupId: EagleID
    var tags: [String]
    var removeFromSource: Bool
}

// MARK: Self.Output
public extension AddTagsToTagGroup {
    typealias Output = EagleTagGroup
}

// MARK: Self: Codable
extension AddTagsToTagGroup: Codable {}

// MARK: Self: Equatable
extension AddTagsToTagGroup: Equatable {}

// MARK: Self: Sendable
extension AddTagsToTagGroup: Sendable {}
