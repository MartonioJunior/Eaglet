//
//  UpdateTagGroup.swift
//  Eaglet
//
//  Created by Martônio Júnior on 21/10/2026.
//

public import EagletCore

public struct UpdateTagGroup {
    public var id: EagleID
    public var name: String?
    public var tags: [String]?
    public var color: EagleColor?
    public var description: String?
}

// MARK: Self.Output
public extension UpdateTagGroup {
    typealias Output = EagleTagGroup
}

// MARK: Self: Codable
extension UpdateTagGroup: Codable {}

// MARK: Self: Equatable
extension UpdateTagGroup: Equatable {}

// MARK: Self: Sendable
extension UpdateTagGroup: Sendable {}
