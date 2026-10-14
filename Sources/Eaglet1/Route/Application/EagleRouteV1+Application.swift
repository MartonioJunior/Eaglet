//
//  EagleRouteV1+Application.swift
//  SwiftKnowledge
//
//  Created by Martônio Júnior on 14/04/25.
//

public import CasePaths
public import EagletCore
public import URLRouting

public extension EagleRouteV1 {
    /// Route related to the Eagle application itself.
    @CasePathable
    enum Application {
        /// `Get` Obtains detailed information on the Eagle App currently running (version, platform, etc.).
        /// 
        /// In most cases, this could be used to determine whether certain functions are available on the user's device.
        case info
    }
}

// MARK: Self: Sendable
extension EagleRouteV1.Application: Sendable {}

// MARK: URLRoutingClient (EX)
public extension URLRoutingClient where Route == EagleAPI.V1.Route {
    @concurrent
    func getAppInfo() async throws -> EagleAppInfo {
        try await decodedResponse(for: .application(.info), as: EagleAppInfo.self).value
    }
}
