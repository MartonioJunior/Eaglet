//
//  CreateSmartFolder.swift
//  Eaglet
//
//  Created by Martônio Júnior on 21/10/2026.
//

public import EagletCore

public struct CreateSmartFolder {
    var name: String
    var conditions: [EagleSmartFolder.Condition]
    var description: String?
    var iconColor: EagleColor?
    var parent: EagleID?
}

// MARK: Self.Output
public extension CreateSmartFolder {
    struct Output: Codable, Equatable, Sendable {
        var id: String
        var name: String
        var conditions: [EagleSmartFolder.Condition]
        var description: String
        var icon: EagleIcon?
        var iconColor: EagleColor?
        var children: [CreateSmartFolder.Output]
        var modificationTime: UInt
        var imageCount: UInt
    }
}

// MARK: Self: Codable
extension CreateSmartFolder: Codable {}

// MARK: Self: Equatable
extension CreateSmartFolder: Equatable {}

// MARK: Self: Sendable
extension CreateSmartFolder: Sendable {}
