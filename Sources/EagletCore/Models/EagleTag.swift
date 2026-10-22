//
//  EagleTag.swift
//  Eaglet
//
//  Created by Martônio Júnior on 08/10/2026.
//

/// Tag associated with an item on Eagle.
public struct EagleTag {
    var name: String
    var imageCount: UInt
    var groups: [EagleID]
    var pinyin: String
}

// MARK: Self: Codable
extension EagleTag: Codable {}

// MARK: Self: Equatable
extension EagleTag: Equatable {}

// MARK: Self: Sendable
extension EagleTag: Sendable {}
