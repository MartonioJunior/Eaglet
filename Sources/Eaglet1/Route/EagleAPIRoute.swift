//
//  EagleAPIRoute.swift
//  SwiftKnowledge
//
//  Created by Martônio Júnior on 11/04/25.
//

import APIUtils
public import CasePaths
public import Common
import Foundation
import SwiftURLRoutingHelpers
public import URLRouting

@CasePathable
public enum EagleAPIRoute {
    case application(Application = .info)
    case folder(Folder)
    case item(Item)
    case library(Library)
}

// MARK: Self: EagleAPI.Routable
extension EagleAPIRoute: EagleAPI.Routable {
    // swiftlint:disable:next missing_docs
    public static var router: some Router<EagleAPIRoute> {
        OneOf {
            Route(.case(\.application.info)) {
                Path { "application"; "info" }
            }

            Route(.case(\.folder)) {
                Path { "folder" }
                Folder.router
            }

            Route(.case(\.item)) {
                Path { "item" }
                Item.router
            }

            Route(.case(\.library)) {
                Path { "library" }
                Library.router
            }
        }
    }
}

// MARK: Self: Sendable
extension EagleAPIRoute: Sendable {}
