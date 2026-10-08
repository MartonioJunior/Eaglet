//
//  EagleAPI.swift
//  SwiftKnowledge
//
//  Created by Martônio Júnior on 17/04/25.
//

import APIUtils
import CommunicationMacros
import Foundation
public import URLRouting

public enum EagleAPI {
    static var live: EntryPoint {
        .init(#staticURL("http://localhost:41595/api/"))
    }

    public static func decodedRequest<T: Decodable>(
        _ route: EagleAPIRoute,
        as _: T.Type = T.self,
        client: sending URLRoutingClient<EagleAPIRoute> = .eagleAPI
    ) async throws -> T {
        try await client.decodedResponse(
            for: route,
            as: Response<T>.self
        ).value.data
    }
}

// MARK: EagleAPI.Response
public extension EagleAPI {
    struct Response<T: Decodable>: Decodable {
        public let status: String
        public let data: T
    }
}
