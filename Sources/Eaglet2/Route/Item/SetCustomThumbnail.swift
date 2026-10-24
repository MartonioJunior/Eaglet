//
//  SetCustomThumbnail.swift
//  Eaglet
//
//  Created by Martônio Júnior on 22/10/2026.
//

public struct SetCustomThumbnail {
    var itemId: String
    var filePath: String
    var width: UInt
    var height: UInt
}

// MARK: Self: Codable
extension SetCustomThumbnail: Codable {}

// MARK: Self: Equatable
extension SetCustomThumbnail: Equatable {}

// MARK: Self: Sendable
extension SetCustomThumbnail: Sendable {}
