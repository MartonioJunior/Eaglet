//
//  ListFolders.swift
//  Eaglet
//
//  Created by Martônio Júnior on 21/10/2026.
//

public import EagletCore
public import Parsing
public import URLRouting

public struct ListFolders {
    /// Folder ID (get specific folder)
    var id: EagleID?
    var ids: [EagleID]?
    /// Get recently used folders
    var isRecent: Bool
    /// Get currently selected folders
    var isSelected: Bool
    /// Pagination offset
    var offset: UInt
    /// Items per page (default 50, max 1000)
    var limit: UInt

    public init(
        id: EagleID? = nil,
        ids: [EagleID]? = nil,
        isRecent: Bool = false,
        isSelected: Bool = false,
        offset: UInt = 0,
        limit: UInt = 50
    ) {
        self.id = id
        self.ids = ids
        self.isRecent = isRecent
        self.isSelected = isSelected
        self.offset = offset
        self.limit = limit
    }
}

// MARK: Self.Output
public extension ListFolders {
    struct Output {
        var data: [EagleFolder]
        var total: UInt
        var offset: UInt
        var limit: UInt
    }
}

extension ListFolders.Output: Codable {}
extension ListFolders.Output: Equatable {}
extension ListFolders.Output: Sendable {}

// MARK: Self: Codable
extension ListFolders: Codable {}

// MARK: Self: Equatable
extension ListFolders: Equatable {}

// MARK: Self: RequestGET
extension ListFolders: EagleAPI.RequestGET {
    // swiftlint:disable:next missing_docs
    public static var parser: AnyParserPrinter<URLRequestData, Self> {
        Parse(.memberwise(Self.init)) {
            Query {
                Optionally {
                    Field("id", default: nil)
                }

                Optionally {
                    Field("ids", default: nil) {
                        AnyParserPrinter.listParser()
                    }
                }

                Field("isRecent", default: false) {
                    Bool.parser()
                }

                Field("isSelected", default: false) {
                    Bool.parser()
                }

                Field("offset", default: UInt(0)) {
                    UInt.parser()
                }

                Field("limit", default: UInt(50)) {
                    UInt.parser()
                }
            }
        }.eraseToAnyParserPrinter()
    }
}

// MARK: Self: RequestGETPOST
extension ListFolders: EagleAPI.RequestGETPOST {
    // swiftlint:disable:next missing_docs
    public typealias GET = Self
    // swiftlint:disable:next missing_docs
    public typealias POST = Self
}

// MARK: Self: Sendable
extension ListFolders: Sendable {}
