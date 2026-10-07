//
//  EagleAPIRoute.swift
//  SwiftKnowledge
//
//  Created by Martônio Júnior on 11/04/25.
//

import APIUtils
public import CasePaths
import Foundation
public import URLRouting
import SwiftURLRoutingHelpers

@CasePathable
public enum EagleAPIRoute {
    case application(Application = .info)
    case folder(Folder)
    case item(Item)
    case library(Library)
}

// MARK: Self: Parseable
extension EagleAPIRoute {
    static var router: some Router<EagleAPIRoute> {
        OneOf {
            Route(.case(\.application.info)) {
                Path { "application"; "info" }
            }

            Route(.case(\.folder)) {
                Path { "folder" }
                EagleAPIRoute.Folder.router
            }

            Route(.case(\.item)) {
                Path { "item" }
                EagleAPIRoute.Item.router
            }

            Route(.case(\.library)) {
                Path { "library" }
                EagleAPIRoute.Library.router
            }
        }
    }

    public static func url(for route: Self) -> String {
        router.path(for: route)
    }
}

// MARK: Self: Sendable
extension EagleAPIRoute: Sendable {}

// MARK: URLRoutingClient (EX)
public extension URLRoutingClient where Route == EagleAPIRoute {
    static var eagleAPI: Self {
        .live(router: EagleAPIRoute.router.entryPoint(EagleAPI.live))
    }
}
