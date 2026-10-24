//
//  ListItems.swift
//  Eaglet
//
//  Created by Martônio Júnior on 22/10/2026.
//

public import EagletCore
public import Parsing
public import URLRouting

public enum ListItems: EagleAPI.RequestGETPOST {}

// MARK: Self.GET
public extension ListItems {
    struct GET: Codable, Equatable, Sendable {
        /// Item ID (returns a single item when specified)
        var id: EagleID?
        /// Filter by file extension (e.g. png, jpg)
        var ext: String?
        /// Filter by annotation
        var annotation: String?
        /// Filter by source URL
        var url: String?
        /// Filter by shape (square, landscape, portrait)
        var shape: String?
        /// Filter by rating (0-5)
        var rating: String?
        /// Pagination offset
        var offset: UInt
        /// Items per page (default 50, max 1000)
        var limit: UInt
    }
}

extension ListItems.GET: EagleAPI.RequestGET {
    // swiftlint:disable:next missing_docs
    public static var parser: AnyParserPrinter<URLRequestData, Self> {
        Parse(.memberwise(Self.init)) {
            Query {
                Optionally { Field("id", default: nil) }
                Optionally { Field("ext", default: nil) }
                Optionally { Field("annotationg", default: nil) }
                Optionally { Field("url", default: nil) }
                Optionally { Field("shape", default: nil) }
                Optionally { Field("rating", default: nil) }
                Field("offset", default: UInt(0)) { UInt.parser() }
                Field("limit", default: UInt(50)) { UInt.parser() }
            }
        }.eraseToAnyParserPrinter()
    }
}

// MARK: Self.POST
public extension ListItems {
    struct POST: Codable, Equatable, Sendable {
        var id: EagleID
        var ids: [EagleID]
        var smartFolders: [EagleID]
        var tags: [String]
        var folders: [EagleID]
        var keywords: [String]
        var ext: String
        var annotation: String
        var url: String
        var shape: String
        var rating: UInt
        var isSelected: Bool
        var isUnfiled: Bool
        var isUntagged: Bool
        var fields: [String]
        var offset: UInt
        var pagination: UInt
    }
}
