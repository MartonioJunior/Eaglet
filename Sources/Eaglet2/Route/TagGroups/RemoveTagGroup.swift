//
//  RemoveTagGroup.swift
//  Eaglet
//
//  Created by Martônio Júnior on 21/10/2026.
//

public import EagletCore

public struct RemoveTagGroup {
    public var id: EagleID
}

// MARK: Self.Output
public extension RemoveTagGroup {
    typealias Output = Bool
}

// MARK: Self: Codable
extension RemoveTagGroup: Codable {}

// MARK: Self: Equatable
extension RemoveTagGroup: Equatable {}

// MARK: Self: Sendable
extension RemoveTagGroup: Sendable {}
