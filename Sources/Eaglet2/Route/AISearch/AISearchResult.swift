//
//  AISearchResult.swift
//  Eaglet
//
//  Created by Martônio Júnior on 22/10/2026.
//

public import EagletCore

public struct AISearchResult {
    public var item: Item
    public var score: Double
}

// MARK: Self.Item
public extension AISearchResult {
    struct Item: Codable, Equatable, Sendable {
        public var id: EagleID
        public var name: String
        public var ext: String
        public var width: UInt
        public var height: UInt
        public var tags: [String]
        public var star: UInt
    }
}

// MARK: Self: Codable
extension AISearchResult: Codable {}

// MARK: Self: Equatable
extension AISearchResult: Equatable {}

// MARK: Self: Sendable
extension AISearchResult: Sendable {}
