//
//  CreateTagGroup.swift
//  Eaglet
//
//  Created by Martônio Júnior on 21/10/2026.
//

public import EagletCore

public struct CreateTagGroup {
    public var name: String
    public var tags: [String]?
    public var color: EagleColor?
    public var description: String?
}

// MARK: Self.Output
public extension CreateTagGroup {
    struct Output: Codable, Equatable, Sendable {
        public var id: EagleID
        public var name: String
        public var tags: [String]
    }
}

// MARK: Self: Codable
extension CreateTagGroup: Codable {}

// MARK: Self: Equatable
extension CreateTagGroup: Equatable {}

// MARK: Self: Sendable
extension CreateTagGroup: Sendable {}
