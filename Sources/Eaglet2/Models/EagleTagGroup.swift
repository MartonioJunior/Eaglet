//
//  EagleTagGroup.swift
//  Eaglet
//
//  Created by Martônio Júnior on 21/10/2026.
//

public import EagletCore

public struct EagleTagGroup {
    public var id: EagleID
    public var name: String
    public var tags: [String]
    public var hashKey: String
    public var color: EagleColor?
    public var description: String?
}

// MARK: Self: Codable
extension EagleTagGroup: Codable {
    enum CodingKeys: String, CodingKey {
        case color
        case description
        case hashKey = "$$hashKey"
        case id
        case name
        case tags
    }
}

// MARK: Self: Equatable
extension EagleTagGroup: Equatable {}

// MARK: Self: Sendable
extension EagleTagGroup: Sendable {}
