//
//  AISearchResult.swift
//  Eaglet
//
//  Created by Martônio Júnior on 22/10/2026.
//

public import EagletCore

public struct AISearchResult {
    var item: Item
    var score: Double
}

// MARK: Self.Item
public extension AISearchResult {
    struct Item: Codable, Equatable, Sendable {
        var id: EagleID
        var name: String
        var ext: String
        var width: UInt
        var height: UInt
        var tags: [String]
        var star: UInt
    }
}

// MARK: Self: Codable
extension AISearchResult: Codable {}

// MARK: Self: Equatable
extension AISearchResult: Equatable {}

// MARK: Self: Sendable
extension AISearchResult: Sendable {}
