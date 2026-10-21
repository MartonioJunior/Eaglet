//
//  EagleAPI+Pagination.swift
//  Eaglet
//
//  Created by Martônio Júnior on 21/10/2026.
//

public extension EagleAPI {
    struct Pagination {
        var offset: UInt
        var limit: UInt
    }
}

// MARK: Self: Codable
extension EagleAPI.Pagination: Codable {}

// MARK: Self: Equatable
extension EagleAPI.Pagination: Equatable {}

// MARK: Self: Sendable
extension EagleAPI.Pagination: Sendable {}
