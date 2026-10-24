//
//  AISearchSyncStatus.swift
//  Eaglet
//
//  Created by Martônio Júnior on 22/10/2026.
//

public struct AISearchSyncStatus {
    var isSyncing: Bool
    var syncedCount: UInt
    var totalCount: UInt
    var progress: Double
}

// MARK: Self: Codable
extension AISearchSyncStatus: Codable {}

// MARK: Self: Equatable
extension AISearchSyncStatus: Equatable {}

// MARK: Self: Sendable
extension AISearchSyncStatus: Sendable {}
