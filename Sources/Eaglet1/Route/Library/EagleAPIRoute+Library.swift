//
//  EagleAPIRoute+Library.swift
//  SwiftKnowledge
//
//  Created by Martônio Júnior on 14/04/25.
//

public import CasePaths
import Foundation
public import URLRouting

public extension EagleAPIRoute {
    @CasePathable
    enum Library {
        case info
        case history
        case `switch`(EagleLibrary.Path)
        case icon(EagleLibrary.Path)
    }
}

// MARK: Self: EagleAPI.Routable
extension EagleAPIRoute.Library: EagleAPI.Routable {
    // swiftlint:disable:next missing_docs
    public static var router: some Router<EagleAPIRoute.Library> {
        OneOf {
            Route(.case(\.info)) {
                Path { "info" }
            }

            Route(.case(\.history)) {
                Path { "history" }
            }

            Route(.case(\.switch)) {
                Method.post
                Path { "switch" }
                Body(.json(EagleLibrary.Path.self))
            }

            Route(.case(\.icon)) {
                Path { "icon" }
                Query {
                    Field("libraryPath")
                }
            }
        }
    }
}

// MARK: Self: Sendable
extension EagleAPIRoute.Library: Sendable {}
