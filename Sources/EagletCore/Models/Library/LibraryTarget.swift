//
//  LibraryTarget.swift
//  Eaglet
//
//  Created by Martônio Júnior on 12/10/2026.
//

public struct LibraryTarget {
    /// Path of the library.
    public var libraryPath: String

    public init(_ libraryPath: String) {
        self.libraryPath = libraryPath
    }
}

// MARK: Self: Codable
extension LibraryTarget: Codable {}

// MARK: Self: Equatable
extension LibraryTarget: Equatable {}

// MARK: Self: Sendable
extension LibraryTarget: Sendable {}
