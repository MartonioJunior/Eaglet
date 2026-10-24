//
//  AISearchByItemID.swift
//  Eaglet
//
//  Created by Martônio Júnior on 22/10/2026.
//

public import EagletCore

public struct AISearchByItemID {
    public var itemId: EagleID
    public var options: [String: String]
}

// MARK: Self.Output
public extension AISearchByItemID {
    typealias Output = [AISearchResult]
}


// MARK: Self: Codable
extension AISearchByItemID: Codable {}

// MARK: Self: Equatable
extension AISearchByItemID: Equatable {}

// MARK: Self: Sendable
extension AISearchByItemID: Sendable {}
