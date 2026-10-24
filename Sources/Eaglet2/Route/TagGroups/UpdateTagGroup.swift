//
//  UpdateTagGroup.swift
//  Eaglet
//
//  Created by Martônio Júnior on 21/10/2026.
//

public import EagletCore

public struct UpdateTagGroup {
    var id: EagleID
    var name: String?
    var tags: [String]?
    var color: EagleColor?
    var description: String?
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
