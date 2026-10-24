//
//  RulesSchema.swift
//  Eaglet
//
//  Created by Martônio Júnior on 21/10/2026.
//

import EagletCore

public struct RulesSchema {
    public var name: Definition
    public var url: Definition
    public var annotation: Definition
    public var comments: Definition
    public var camera: Definition
    public var folderName: Definition
    public var width: Definition
    public var height: Definition
    public var iso: Definition
    public var aperture: Definition
    public var focalLength: Definition
    public var shutter: Definition
    public var bpm: Definition
    public var fileSize: Definition
    public var duration: Definition
    public var createTime: Definition
    public var mtime: Definition
    public var btime: Definition
    public var timestamp: Definition
    public var tags: Definition
    public var folders: Definition
    public var type: Definition
    public var rating: Definition
    public var shape: Definition
    public var color: Definition
    public var fontActivated: Definition
}

// MARK: Self.Definition
public extension RulesSchema {
    struct Definition: Codable, Equatable, Sendable {
        public var category: String
        public var methods: [String]
        public var valueType: String
        public var options: [String]?
        public var noValueMethods: [String]?
        public var extraFields: [String: String]?
    }
}

// MARK: Self: Codable
extension RulesSchema: Codable {}

// MARK: Self: Equatable
extension RulesSchema: Equatable {}

// MARK: Self: Sendable
extension RulesSchema: Sendable {}
