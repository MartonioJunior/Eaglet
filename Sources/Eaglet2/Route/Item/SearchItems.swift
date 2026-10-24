//
//  SearchItems.swift
//  Eaglet
//
//  Created by Martônio Júnior on 22/10/2026.
//

public struct SearchItems {
    var query: String
}

// MARK: Self: Codable
extension SearchItems: Codable {}

// MARK: Self: Equatable
extension SearchItems: Equatable {}

// MARK: Self: Sendable
extension SearchItems: Sendable {}
