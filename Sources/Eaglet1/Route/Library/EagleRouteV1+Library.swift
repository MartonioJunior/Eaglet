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
                Body(.json(EagleLibrary.Path.self))
            }

            Route(.case(\.icon)) {
                Method.get
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

// MARK: URLRoutingClient (EX)
public extension URLRoutingClient where Route == EagleRouteV1 {
    @concurrent
    func getActiveLibraryInfo() async throws -> EagleLibrary {
        try await decodedResponse(for: .library(.info), as: EagleAPI.Response<EagleLibrary>.self).value.data
    }

    @concurrent
    func icon(for library: LibraryTarget) async throws -> EagleImage {
        try await decodedResponse(for: .library(.icon(library.libraryPath)), as: EagleAPI.Response<EagleImage>.self).value.data
    }

    @concurrent
    func libraryHistory() async throws -> [EagleLibrary.Path] {
        try await decodedResponse(for: .library(.history), as: EagleAPI.Response<[EagleLibrary.Path]>.self).value.data
    }

    @concurrent
    func switchLibrary(to target: LibraryTarget) async throws -> EagleAPI.VoidResponse {
        try await request(.library(.switch(target.libraryPath)))
    }
}
