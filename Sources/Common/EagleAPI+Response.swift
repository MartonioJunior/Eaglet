//
//  EagleAPI+Response.swift
//  Eaglet
//
//  Created by Martônio Júnior on 07/10/2026.
//

public import URLRouting

public extension EagleAPI {
    struct Response<T: Decodable>: Decodable {
        public let status: String
        public let data: T
    }
}

// MARK: EagleAPI.Client (EX)
public extension EagleAPI.Client {
    static func decodedRequest<T: Decodable>(
        _ route: sending Route,
        as _: T.Type = T.self,
        client: sending URLRoutingClient<Route>
    ) async throws -> T {
        try await client.decodedResponse(
            for: route,
            as: EagleAPI.Response<T>.self
        ).value.data
    }
}
