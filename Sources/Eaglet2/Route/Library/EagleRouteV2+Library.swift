//
//  EagleRouteV2+Library.swift
//  Eaglet
//
//  Created by Martônio Júnior on 21/10/2026.
//

public import CasePaths
public import EagletCore
import Foundation
public import URLRouting

public extension EagleRouteV2 {
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
        case `switch`(LibraryTarget)
        /// `GET` Obtain the icon of the specified Library.
        case icon(LibraryTarget)
    }
}

// MARK: Self: Equatable
extension EagleRouteV2.Library: Equatable {}

// MARK: Self: EagleAPI.Routable
extension EagleRouteV2.Library: EagleAPI.Routable {
    // swiftlint:disable:next missing_docs
    public static var router: some Router<EagleRouteV2.Library> {
        OneOf {
            Route(.case(\.info)) {
                Method.get
                Path { "info" }
            }

            Route(.case(\.history)) {
                Method.get
                Path { "history" }
            }

            Route(.case(\.switch)) {
                Method.post
                Path { "switch" }
                Body(.json(LibraryTarget.self))
            }

            Route(.case(\.icon)) {
                Method.get
                Path { "icon" }
                Parse(.memberwise(LibraryTarget.init)) {
                    Query {
                        Field("libraryPath")
                    }
                }
            }
        }
    }
}

// MARK: Self: Sendable
extension EagleRouteV2.Library: Sendable {}

// MARK: URLRoutingClient (EX)
public extension URLRoutingClient where Route == EagleRouteV2 {
    @concurrent
    func getActiveLibraryInfo() async throws -> EagleLibrary {
        try await decodedResponse(for: .library(.info), as: EagleAPI.Response<EagleLibrary>.self).value.data
    }

    @concurrent
    func icon(for library: LibraryTarget) async throws -> LibraryIconBuffer {
        try await decodedResponse(for: .library(.icon(library)), as: EagleAPI.Response<LibraryIconBuffer>.self).value.data
    }

    @concurrent
    func libraryHistory() async throws -> LibraryHistory {
        try await decodedResponse(for: .library(.history), as: EagleAPI.Response<LibraryHistory>.self).value.data
    }

    @concurrent
    func switchLibrary(to target: LibraryTarget) async throws -> EagleAPI.Response<Bool> {
        try await decodedResponse(for: .library(.switch(target)), as: EagleAPI.Response<Bool>.self).value
    }
}
