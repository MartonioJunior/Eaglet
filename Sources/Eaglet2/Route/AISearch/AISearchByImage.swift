//
//  AISearchByImage.swift
//  Eaglet
//
//  Created by Martônio Júnior on 22/10/2026.
//

public struct AISearchByImage {
    public var base64: String
    public var options: [String: String]
}

// MARK: Self.Output
public extension AISearchByImage {
    typealias Output = [AISearchResult]
}

// MARK: Self: Codable
extension AISearchByImage: Codable {}

// MARK: Self: Equatable
extension AISearchByImage: Equatable {}

// MARK: Self: Sendable
extension AISearchByImage: Sendable {}
