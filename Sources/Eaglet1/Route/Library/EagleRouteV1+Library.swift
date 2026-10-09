//
//  EagleAPIRoute+Library.swift
//  SwiftKnowledge
//
//  Created by Martônio Júnior on 14/04/25.
//

public import CasePaths
public import Common
import Foundation
public import URLRouting

public extension EagleRouteV1 {
    /// Route containing operations for an Eagle library.
    @CasePathable
    enum Library {
        /// `GET` Get detailed information of the library currently running.
        /// 
        /// The function can be used to obtain details such as All Folders, All Smart Folders, All Tag Groups, Quick Access and etc.
        case info
        /// `GET` Get the list of libraries recently opened by the Application. 
        case history
        /// `POST` Switch the library currently opened by Eagle.
        case `switch`(EagleLibrary.Path)
        /// `GET` Obtain the icon of the specified Library.
        case icon(EagleLibrary.Path)
    }
}

// MARK: Self: Equatable
extension EagleRouteV1.Library: Equatable {}

// MARK: Self: EagleAPI.Routable
extension EagleRouteV1.Library: EagleAPI.Routable {
    // swiftlint:disable:next missing_docs
    public static var router: some Router<EagleRouteV1.Library> {
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
extension EagleRouteV1.Library: Sendable {}
