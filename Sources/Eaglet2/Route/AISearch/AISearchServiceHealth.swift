//
//  AISearchServiceHealth.swift
//  Eaglet
//
//  Created by Martônio Júnior on 22/10/2026.
//

public struct AISearchServiceHealth {
    var healthy: Bool
}

// MARK: Self: Codable
extension AISearchServiceHealth: Codable {}

// MARK: Self: Equatable
extension AISearchServiceHealth: Equatable {}

// MARK: Self: Sendable
extension AISearchServiceHealth: Sendable {}
