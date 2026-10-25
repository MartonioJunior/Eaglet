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
        public var id: EagleID?
        /// Filter by file extension (e.g. png, jpg)
        public var ext: String?
        /// Filter by annotation
        public var annotation: String?
        /// Filter by source URL
        public var url: String?
        /// Filter by shape (square, landscape, portrait)
        public var shape: String?
        /// Filter by rating (0-5)
        public var rating: String?
        /// Pagination offset
        public var offset: UInt
        /// Items per page (default 50, max 1000)
        public var limit: UInt

        public init(
            id: EagleID? = nil,
            ext: String? = nil,
            annotation: String? = nil,
            url: String? = nil,
            shape: String? = nil,
            rating: String? = nil,
            offset: UInt,
            limit: UInt
        ) {
            self.id = id
            self.ext = ext
            self.annotation = annotation
            self.url = url
            self.shape = shape
            self.rating = rating
            self.offset = offset
            self.limit = limit
        }
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
        public var id: EagleID?
        public var ids: [EagleID]?
        public var smartFolders: [EagleID]?
        public var tags: [String]?
        public var folders: [EagleID]?
        public var keywords: [String]?
        public var ext: String?
        public var annotation: String?
        public var url: String?
        public var shape: String?
        public var rating: UInt?
        public var isSelected: Bool?
        public var isUnfiled: Bool?
        public var isUntagged: Bool?
        public var fields: [String]?
        public var offset: UInt = 0
        public var limit: UInt = 50

        public init(
            id: EagleID?,
            ids: [EagleID]?,
            smartFolders: [EagleID]?,
            tags: [String]?,
            folders: [EagleID]?,
            keywords: [String]?,
            ext: String?,
            annotation: String?,
            url: String?,
            shape: String?,
            rating: UInt?,
            isSelected: Bool?,
            isUnfiled: Bool?,
            isUntagged: Bool?,
            fields: [String]?,
            offset: UInt = 0,
            limit: UInt = 50
        ) {
            self.id = id
            self.ids = ids
            self.smartFolders = smartFolders
            self.tags = tags
            self.folders = folders
            self.keywords = keywords
            self.ext = ext
            self.annotation = annotation
            self.url = url
            self.shape = shape
            self.rating = rating
            self.isSelected = isSelected
            self.isUnfiled = isUnfiled
            self.isUntagged = isUntagged
            self.fields = fields
            self.offset = offset
            self.limit = limit
        }
    }
}
