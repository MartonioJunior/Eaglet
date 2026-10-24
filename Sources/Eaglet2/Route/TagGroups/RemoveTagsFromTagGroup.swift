//
//  RemoveTagsFromTagGroup.swift
//  Eaglet
//
//  Created by Martônio Júnior on 21/10/2026.
//

public import EagletCore

public struct RemoveTagsFromTagGroup {
    var groupId: EagleID
    var tags: [String]
}

// MARK: Self.Output
public extension RemoveTagsFromTagGroup {
    typealias Output = EagleTagGroup
}

// MARK: Self: Codable
extension RemoveTagsFromTagGroup: Codable {}

// MARK: Self: Equatable
extension RemoveTagsFromTagGroup: Equatable {}

// MARK: Self: Sendable
extension RemoveTagsFromTagGroup: Sendable {}
