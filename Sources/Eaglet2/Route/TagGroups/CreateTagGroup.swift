//
//  CreateTagGroup.swift
//  Eaglet
//
//  Created by Martônio Júnior on 21/10/2026.
//

public import EagletCore

public struct CreateTagGroup {
    var name: String
    var tags: [String]?
    var color: EagleColor?
    var description: String?
}

// MARK: Self.Output
public extension CreateTagGroup {
    struct Output: Codable, Equatable, Sendable {
        var id: EagleID
        var name: String
        var tags: [String]
    }
}

// MARK: Self: Codable
extension CreateTagGroup: Codable {}

// MARK: Self: Equatable
extension CreateTagGroup: Equatable {}

// MARK: Self: Sendable
extension CreateTagGroup: Sendable {}
