//
//  EagleStyle.swift
//  Eaglet
//
//  Created by Martônio Júnior on 08/10/2026.
//

public struct EagleStyle {
    public var depth: Int
    public var first: Bool
    public var last: Bool

    public init(
        depth: Int,
        first: Bool,
        last: Bool
    ) {
        self.depth = depth
        self.first = first
        self.last = last
    }
}

// MARK: Self: Decodable
extension EagleStyle: Decodable {}

// MARK: Self: Encodable
extension EagleStyle: Encodable {}

// MARK: Self: Equatable
extension EagleStyle: Equatable {}

// MARK: Self: Sendable
extension EagleStyle: Sendable {}
