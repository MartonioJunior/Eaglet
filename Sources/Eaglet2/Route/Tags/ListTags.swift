//
//  ListTags.swift
//  Eaglet
//
//  Created by Martônio Júnior on 21/10/2026.
//

public import EagletCore
public import Parsing
public import URLRouting

public struct ListTags {
    /// Fuzzy search by name
    public var name: String
    /// Pagination offset
    public var offset: UInt
    /// Items per page (default 50, max 1000)
    public var limit: UInt

    public init(
        name: String = "",
        offset: UInt = 0,
        limit: UInt = 50
    ) {
        self.name = name
        self.offset = offset
        self.limit = limit
    }
}

// MARK: Self.Output
public extension ListTags {
    typealias Output = EagleAPI.PaginatedResponse<EagleTag>
}

// MARK: Self: Codable
extension ListTags: Codable {}

// MARK: Self: Equatable
extension ListTags: Equatable {}

// MARK: Self: RequestGET
extension ListTags: EagleAPI.RequestGET {
    // swiftlint:disable:next missing_docs
    public static var parser: AnyParserPrinter<URLRequestData, Self> {
        Parse(.memberwise(Self.init)) {
            Query {
                Field("name", default: "")
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
extension ListTags: EagleAPI.RequestGETPOST {
    // swiftlint:disable:next missing_docs
    public typealias GET = Self
    // swiftlint:disable:next missing_docs
    public typealias POST = Self
}

// MARK: Self: Sendable
extension ListTags: Sendable {}
