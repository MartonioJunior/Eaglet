//
//  AISearchByText.swift
//  Eaglet
//
//  Created by Martônio Júnior on 22/10/2026.
//

public struct AISearchByText {
    public var query: String
    public var options: [String: String]
}

// MARK: Self.Output
public extension AISearchByText {
    typealias Output = [AISearchResult]
}


// MARK: Self: Codable
extension AISearchByText: Codable {}

// MARK: Self: Equatable
extension AISearchByText: Equatable {}

// MARK: Self: Sendable
extension AISearchByText: Sendable {}
