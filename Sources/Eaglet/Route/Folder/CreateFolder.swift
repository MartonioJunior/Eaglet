//
//  CreateFolder.swift
//  SwiftKnowledge
//
//  Created by Martônio Júnior on 14/04/25.
//

public struct CreateFolder: Codable {
    var folderName: String
    var parent: EagleFolder.ID? = nil
}

// MARK: DotSyntax
public extension CreateFolder {
    static func named(_ name: String, parent: EagleFolder.ID? = nil) -> Self {
        .init(folderName: name, parent: parent)
    }
}

// MARK: Self: Sendable
extension CreateFolder: Sendable {}
