//
//  EagleAPI+Pagination.swift
//  Eaglet
//
//  Created by Martônio Júnior on 21/10/2026.
//

public import Parsing
public import URLRouting

public extension EagleAPI {
    struct Pagination {
        public var offset: UInt
        public var limit: UInt

        public init(
            offset: UInt,
            limit: UInt
        ) {
            self.offset = offset
            self.limit = limit
        }
    }

    struct PaginatedResponse<T> {
        public var data: T
        public var total: UInt
        public var offset: UInt
        public var limit: UInt

        public init(
            data: T,
            total: UInt,
            offset: UInt,
            limit: UInt,
        ) {
            self.data = data
            self.total = total
            self.offset = offset
            self.limit = limit
        }
    }
}

// MARK: Self: Codable
extension EagleAPI.Pagination: Codable {}
extension EagleAPI.PaginatedResponse: Codable where T: Codable {}

// MARK: Self: Equatable
extension EagleAPI.Pagination: Equatable {}
extension EagleAPI.PaginatedResponse: Equatable where T: Equatable {}

// MARK: Self: RequestGET
extension EagleAPI.Pagination: EagleAPI.RequestGET {
    // swiftlint:disable:next missing_docs
    public static var parser: AnyParserPrinter<URLRequestData, Self> {
        Parse(.memberwise(Self.init)) {
            Query {
                Field("offset", default: UInt(0)) { UInt.parser() }
                Field("limit", default: UInt(50)) { UInt.parser() }
            }
        }.eraseToAnyParserPrinter()
    }
}

// MARK: Self: Sendable
extension EagleAPI.Pagination: Sendable {}
extension EagleAPI.PaginatedResponse: Sendable where T: Sendable {}
