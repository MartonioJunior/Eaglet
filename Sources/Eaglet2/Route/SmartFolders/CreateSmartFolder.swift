//
//  CreateSmartFolder.swift
//  Eaglet
//
//  Created by Martônio Júnior on 21/10/2026.
//

public import EagletCore

public struct CreateSmartFolder {
    public var name: String
    public var conditions: [EagleSmartFolder.Condition]
    public var description: String?
    public var iconColor: EagleColor?
    public var parent: EagleID?
}

// MARK: Self.Output
public extension CreateSmartFolder {
    struct Output: Codable, Equatable, Sendable {
        public var id: String
        public var name: String
        public var conditions: [EagleSmartFolder.Condition]
        public var description: String
        public var icon: EagleIcon?
        public var iconColor: EagleColor?
        public var children: [CreateSmartFolder.Output]
        public var modificationTime: UInt
        public var imageCount: UInt
    }
}

// MARK: Self: Codable
extension CreateSmartFolder: Codable {}

// MARK: Self: Equatable
extension CreateSmartFolder: Equatable {}

// MARK: Self: Sendable
extension CreateSmartFolder: Sendable {}
