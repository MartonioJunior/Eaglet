//
//  MergeTags.swift
//  Eaglet
//
//  Created by Martônio Júnior on 21/10/2026.
//

public struct MergeTags {
    /// Source tag name (will be removed)
    public var source: String
    /// Target tag name (will be kept)
    public var target: String
}

// MARK: Self.Output
public extension MergeTags {
    struct Output: Codable, Equatable, Sendable {
        var affectedItems: UInt
        var sourceRemoved: Bool
    }
}

// MARK: Self: Codable
extension MergeTags: Codable {}

// MARK: Self: Equatable
extension MergeTags: Equatable {}

// MARK: Self: Sendable
extension MergeTags: Sendable {}
