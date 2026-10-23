//
//  GetPostRoute.swift
//  Eaglet
//
//  Created by Martônio Júnior on 22/10/2026.
//

public import CasePaths
public import Parsing
public import URLRouting

@CasePathable
public enum GETPOSTRoute<T: EagleAPI.RequestGETPOST> {
    case get(T.GET)
    case post(T.POST)
}

// MARK: Self: Decodable
extension GETPOSTRoute: Decodable where T.GET: Decodable, T.POST: Decodable {}

// MARK: Self: Encodable
extension GETPOSTRoute: Encodable where T.GET: Encodable, T.POST: Encodable {}

// MARK: Self: Equatable
extension GETPOSTRoute: Equatable where T.GET: Equatable, T.POST: Equatable {}

// MARK: Self: Routable
extension GETPOSTRoute: EagleAPI.Routable {
    // swiftlint:disable:next missing_docs
    public static var router: some Router<Self> {
        AnyParserPrinter(
            OneOf {
                Route(.case(\.get)) {
                    Method.get
                    T.GET.parser
                }

                Route(.case(\.post)) {
                    Method.post
                    Body(.json(T.POST.self))
                }
            }
        )
    }
}

// MARK: Self: Equatable
extension GETPOSTRoute: Sendable where T.GET: Sendable, T.POST: Sendable {}
