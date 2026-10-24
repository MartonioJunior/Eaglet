//
//  RulesSchema.swift
//  Eaglet
//
//  Created by Martônio Júnior on 21/10/2026.
//

import EagletCore

public struct RulesSchema {
    var name: Definition
    var url: Definition
    var annotation: Definition
    var comments: Definition
    var camera: Definition
    var folderName: Definition
    var width: Definition
    var height: Definition
    var iso: Definition
    var aperture: Definition
    var focalLength: Definition
    var shutter: Definition
    var bpm: Definition
    var fileSize: Definition
    var duration: Definition
    var createTime: Definition
    var mtime: Definition
    var btime: Definition
    var timestamp: Definition
    var tags: Definition
    var folders: Definition
    var type: Definition
    var rating: Definition
    var shape: Definition
    var color: Definition
    var fontActivated: Definition
}

// MARK: Self.Definition
public extension RulesSchema {
    struct Definition: Codable, Equatable, Sendable {
        var category: String
        var methods: [String]
        var valueType: String
        var options: [String]?
        var noValueMethods: [String]?
        var extraFields: [String: String]?
    }
}

// MARK: Self: Codable
extension RulesSchema: Codable {}

// MARK: Self: Equatable
extension RulesSchema: Equatable {}

// MARK: Self: Sendable
extension RulesSchema: Sendable {}
