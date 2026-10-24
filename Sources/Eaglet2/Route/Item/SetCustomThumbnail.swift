//
//  SetCustomThumbnail.swift
//  Eaglet
//
//  Created by Martônio Júnior on 22/10/2026.
//

public struct SetCustomThumbnail {
    public var itemId: String
    public var filePath: String
    public var width: UInt
    public var height: UInt
}

// MARK: Self: Codable
extension SetCustomThumbnail: Codable {}

// MARK: Self: Equatable
extension SetCustomThumbnail: Equatable {}

// MARK: Self: Sendable
extension SetCustomThumbnail: Sendable {}
