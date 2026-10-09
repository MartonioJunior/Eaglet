//
//  EagleStyle.swift
//  Eaglet
//
//  Created by Martônio Júnior on 08/10/2026.
//

struct EagleStyle {
    var depth: Int
    var first: Bool
    var last: Bool
}

// MARK: Self: Decodable
extension EagleStyle: Decodable {}

// MARK: Self: Encodable
extension EagleStyle: Encodable {}

// MARK: Self: Equatable
extension EagleStyle: Equatable {}

// MARK: Self: Sendable
extension EagleStyle: Sendable {}
