//
//  FetchComments.swift
//  Eaglet
//
//  Created by Martônio Júnior on 22/10/2026.
//

public import EagletCore
public import Parsing
public import URLRouting

public struct FetchComments {
    var id: EagleID
}

// MARK: Self.Output
public extension FetchComments {
    typealias Output = [EagleComment]
}

// MARK: Self: Codable
extension FetchComments: Codable {}

// MARK: Self: Equatable
extension FetchComments: Equatable {}

// MARK: Self: RequestGET
extension FetchComments: EagleAPI.RequestGET {
    // swiftlint:disable:next missing_docs
    public static var parser: AnyParserPrinter<URLRequestData, Self> {
        Parse(.memberwise(Self.init)) {
            Query {
                Field("id")
            }
        }.eraseToAnyParserPrinter()
    }
}

// MARK: Self: Sendable
extension FetchComments: Sendable {}
