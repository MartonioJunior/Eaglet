//
//  LibraryIconBuffer.swift
//  Eaglet
//
//  Created by Martônio Júnior on 21/10/2026.
//

public struct LibraryIconBuffer {
    var type: String
    var data: [UInt8]
}

// MARK: Self: Codable
extension LibraryIconBuffer: Codable {}

// MARK: Self: Equatable
extension LibraryIconBuffer: Equatable {}

// MARK: Self: Sendable
extension LibraryIconBuffer: Sendable {}
