//
//  EagleRouteV1.swift
//  Eaglet
//
//  Created by Martônio Júnior on 11/04/25.
//

import APIUtils
public import CasePaths
public import Common
import Foundation
import SwiftURLRoutingHelpers
public import URLRouting

/// Route describing Eagle's v1 API routes.
@CasePathable
public enum EagleRouteV1 {
    /// Performs operations related to the application.
    case application(Application = .info)
    /// Performs operations related to folders inside a library.
    case folder(Folder)
    /// Performs operations related to items inside a library.
    case item(Item)
    /// Performs operations related to Eagle libraries.
    case library(Library)
}

// MARK: Self: Equatable
extension EagleRouteV1: Equatable {}

// MARK: Self: EagleAPI.Routable
extension EagleRouteV1: EagleAPI.Routable {
    // swiftlint:disable:next missing_docs
    public static var router: some Router<EagleRouteV1> {
        OneOf {
            Route(.case(\.application.info)) {
                Scheme.http
                Method.get
                Path { "application"; "info" }
            }

            Route(.case(\.folder)) {
                Scheme.http
                Path { "folder" }
                Folder.router
            }

            Route(.case(\.item)) {
                Scheme.http
                Path { "item" }
                Item.router
            }

            Route(.case(\.library)) {
                Scheme.http
                Path { "library" }
                Library.router
            }
        }
    }
}

// MARK: Self: Sendable
extension EagleRouteV1: Sendable {}
