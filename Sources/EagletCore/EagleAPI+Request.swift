//
//  EagleAPI+Request.swift
//  Eaglet
//
//  Created by Martônio Júnior on 22/10/2026.
//

public import Parsing
public import URLRouting

public extension EagleAPI {
    protocol RequestGET {
        static var parser: AnyParserPrinter<URLRequestData, Self> { get }
    }

    protocol RequestGETPOST {
        associatedtype GET: RequestGET, Codable
        associatedtype POST: Codable
    }
}
