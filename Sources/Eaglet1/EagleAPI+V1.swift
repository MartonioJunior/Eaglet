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
    /// Legacy version of Eagle's Web API.
    /// 
    /// The Eagle API server will start up when Eagle App is opened,
    /// hence you'd have to open Eagle App first to gain access to all function of Eagle API.
    /// 
    /// All API server will start-up upon opening Eagle App, the default listening port is 41595,
    /// i.e. http://localhost:41595/ . Results returned will be in JSON format.
    /// 
    /// Eagle 1.11 Build21 (Released on 2020/06/17) or later is required to gain access to this version of the API.
    enum V1 {
        public static func decodedRequest<T: Decodable>(
            _ route: EagleRouteV1,
            as type: T.Type = T.self,
        ) async throws -> T {
            try await decodedRequest(route, as: type, client: .eagle(Self.self))
        }
    }
}

// MARK: Self: EagleAPI.Client
extension EagleAPI.V1: EagleAPI.Client {
    // swiftlint:disable:next missing_docs
    public typealias Route = EagleRouteV1
    // swiftlint:disable:next missing_docs
    public static var live: EntryPoint {
        .init(#staticURL("http://localhost:41595/api/"))
    }
}
