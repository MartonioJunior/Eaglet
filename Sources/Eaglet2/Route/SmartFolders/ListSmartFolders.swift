//
//  ListSmartFolders.swift
//  Eaglet
//
//  Created by Martônio Júnior on 21/10/2026.
//

public import EagletCore
public import Parsing
public import URLRouting

public enum ListSmartFolders: EagleAPI.RequestGETPOST {}

// MARK: Self.GET
public extension ListSmartFolders {
    struct GET: Codable, Equatable, Sendable {
        public var id: EagleID?
        public var offset: UInt
        public var limit: UInt
    }
}

extension ListSmartFolders.GET: EagleAPI.RequestGET {
    // swiftlint:disable:next missing_docs
    public static var parser: AnyParserPrinter<URLRequestData, Self> {
        Parse(.memberwise(Self.init)) {
            Query {
                Optionally {
                    Field("id", default: nil)
                }
                Field("offset", default: UInt(0)) { UInt.parser() }
                Field("limit", default: UInt(50)) { UInt.parser() }
            }
        }.eraseToAnyParserPrinter()
    }
}

// MARK: Self.POST
public extension ListSmartFolders {
    struct POST: Codable, Equatable, Sendable {
        public var id: EagleID?
        public var ids: [EagleID]?
        public var offset: UInt
        public var limit: UInt
    }
}
