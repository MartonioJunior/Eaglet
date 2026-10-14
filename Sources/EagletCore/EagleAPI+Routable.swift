//
//  EagleAPI+Routable.swift
//  Eaglet
//
//  Created by Martônio Júnior on 07/10/2026.
//

import APIUtils
public import URLRouting

public extension EagleAPI {
    /// Type is part of the API route in Eagle.
    protocol Routable {
        /// Type representing the routing parser used by this model.
        associatedtype Router: URLRouting.Router<Self>
        /// Router representing a segment of Eagle's Web API.
        static var router: Router { get }
    }
}

// MARK: Default Implementation
public extension EagleAPI.Routable {
    static func path(for route: Self) -> String {
        router.path(for: route)
    }
}

// MARK: URLRoutingClient (EX)
public extension URLRoutingClient where Route: EagleAPI.Routable {
    static func eagle<T: EagleAPI.Client>(
        _: T.Type = T.self
    ) -> Self where T.Route == Route {
        .live(router: Route.router.entryPoint(T.live))
    }
}
