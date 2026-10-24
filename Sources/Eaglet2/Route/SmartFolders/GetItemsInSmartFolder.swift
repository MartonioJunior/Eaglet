//
//  GetItemsInSmartFolder.swift
//  Eaglet
//
//  Created by Martônio Júnior on 21/10/2026.
//

public import EagletCore
public import Parsing
public import URLRouting

public struct GetItemsInSmartFolder {
    var smartFolderId: EagleID
    var orderBy: String?
    var fields: [String]?
    var offset: UInt
    var limit: UInt
}

// MARK: Self.Output
public extension GetItemsInSmartFolder {
    struct Output: Codable, Equatable, Sendable {
        var id: EagleID
        var name: String
        var size: UInt
        var btime: UInt
        var mtime: UInt
        var ext: String
        var tags: [String]
        var folders: [EagleID]
        var isDeleted: Bool
        var url: String
        var annotation: String
        var modificationTime: UInt
        var width: UInt
        var height: UInt
        var lastModified: UInt
        var palettes: [EaglePaletteColor]
    }
}

// MARK: Self: Codable
extension GetItemsInSmartFolder: Codable {}

// MARK: Self: Equatable
extension GetItemsInSmartFolder: Equatable {}

// MARK: Self: RequestGET
extension GetItemsInSmartFolder {
    // swiftlint:disable:next missing_docs
    public static var parser: AnyParserPrinter<URLRequestData, Self> {
        Parse(.memberwise(Self.init)) {
            Query {
                Field("smartFolderId")
                Optionally {
                    Field("orderBy", default: nil)
                }
                Optionally {
                    Field("fields", default: nil) { AnyParserPrinter.listParser() }
                }
                Field("offset", default: UInt(0)) { UInt.parser() }
                Field("limit", default: UInt(50)) { UInt.parser() }
            }
        }.eraseToAnyParserPrinter()
    }
}


// MARK: Self: Sendable
extension GetItemsInSmartFolder: Sendable {}
