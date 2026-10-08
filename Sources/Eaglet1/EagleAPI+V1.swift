//
//  EagleAPI.swift
//  SwiftKnowledge
//
//  Created by Martônio Júnior on 17/04/25.
//

public import APIUtils
public import Common
import CommunicationMacros
import Foundation
import URLRouting

public extension EagleAPI {
    enum V1 {
        public static func decodedRequest<T: Decodable>(
            _ route: EagleAPIRoute,
            as type: T.Type = T.self,
        ) async throws -> T {
            try await decodedRequest(route, as: type, client: .eagle(Self.self))
        }
    }
}

// MARK: Self: EagleAPI.Client
extension EagleAPI.V1: EagleAPI.Client {
    public typealias Route = EagleAPIRoute

    public static var live: EntryPoint {
        .init(#staticURL("http://localhost:41595/api/"))
    }
}
