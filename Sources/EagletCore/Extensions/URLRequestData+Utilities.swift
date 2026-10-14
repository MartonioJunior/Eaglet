//
//  URLRequestData+Utilities.swift
//  Eaglet
//
//  Created by Martônio Júnior on 12/10/2026.
//

public import Foundation
public import OrderedCollections
public import URLRouting

public extension URLRequestData {
    static func get(
        scheme: String? = "http",
        path: String,
        query: OrderedDictionary<String, [String?]> = .init(),
        fragment: String? = nil,
        headers: OrderedDictionary<String, [String?]> = .init(),
        body: Data? = nil
    ) -> Self {
        .init(
            method: "GET",
            scheme: scheme,
            path: path,
            query: query,
            fragment: fragment,
            headers: headers,
            body: body
        )
    }

    static func post(
        scheme: String? = "http",
        path: String,
        query: OrderedDictionary<String, [String?]> = .init(),
        fragment: String? = nil,
        headers: OrderedDictionary<String, [String?]> = .init(),
        body: Data? = nil
    ) -> Self {
        .init(
            method: "POST",
            scheme: scheme,
            path: path,
            query: query,
            fragment: fragment,
            headers: headers,
            body: body
        )
    }
}
