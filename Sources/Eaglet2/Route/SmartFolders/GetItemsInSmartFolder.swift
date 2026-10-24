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
    public var smartFolderId: EagleID
    public var orderBy: String?
    public var fields: [String]?
    public var offset: UInt
    public var limit: UInt
}

// MARK: Self.Output
public extension GetItemsInSmartFolder {
    struct Output: Codable, Equatable, Sendable {
        public var id: EagleID
        public var name: String
        public var size: UInt
        public var btime: UInt
        public var mtime: UInt
        public var ext: String
        public var tags: [String]
        public var folders: [EagleID]
        public var isDeleted: Bool
        public var url: String
        public var annotation: String
        public var modificationTime: UInt
        public var width: UInt
        public var height: UInt
        public var lastModified: UInt
        public var palettes: [EaglePaletteColor]
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
