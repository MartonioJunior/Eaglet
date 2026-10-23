//
//  EagleAPI+Response.swift
//  Eaglet
//
//  Created by Martônio Júnior on 07/10/2026.
//

public import URLRouting

public extension EagleAPI {
    struct Response<T> {
        public let status: String
        public let message: String?
        public let data: T

        public init(_ data: T, status: String, message: String? = nil) {
            self.data = data
            self.status = status
            self.message = message
        }
    }

    struct VoidResponse: Codable, Equatable, Sendable {
        public let status: String

        public init(_ status: String) {
            self.status = status
        }
    }
}

// MARK: Self: Decodable
extension EagleAPI.Response: Decodable where T: Decodable {}

// MARK: Self: Encodable
extension EagleAPI.Response: Encodable where T: Encodable {}

// MARK: Self: Equatable
extension EagleAPI.Response: Equatable where T: Equatable {}

// MARK: Self: Equatable
extension EagleAPI.Response: Sendable where T: Sendable {}

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

// MARK: URLRoutingClient (EX)
public extension URLRoutingClient {
    @concurrent
    func request(_ route: sending Route) async throws -> EagleAPI.VoidResponse {
        try await decodedResponse(for: route).value
    }
}
