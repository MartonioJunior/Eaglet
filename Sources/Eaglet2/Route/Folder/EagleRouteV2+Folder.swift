//
//  EagleRouteV2+Folder.swift
//  Eaglet
//
//  Created by Martônio Júnior on 21/10/2026.
//

public import CasePaths
public import EagletCore
import Foundation
public import Parsing
public import URLRouting

public extension EagleRouteV2 {
    /// Route that performs a folder operation.
    @CasePathable
    enum Folder {
        /// `POST` Create a folder.
        /// 
        /// The created folder will be put at the bottom of the folder list of the current library.
        case create(CreateFolder)
        /// `POST` Update the specified folder.
        case update(UpdateFolder)
        /// List of folders of the current library
        case list(GETPOSTRoute<ListFolders>)
    }
}

// MARK: DotSyntax
public extension EagleRouteV2.Folder {
    /// `GET` Obtains a list of folders of the current library.
    static func listGet(_ query: ListFolders) -> Self { .list(.get(query)) }
    /// `POST` Obtains a list of folders of the current library.
    static func listPost(_ query: ListFolders) -> Self { .list(.post(query)) }
}

// MARK: Self: Equatable
extension EagleRouteV2.Folder: Equatable {}

// MARK: Self: EagleAPI.Routable
extension EagleRouteV2.Folder: EagleAPI.Routable {
    // swiftlint:disable:next missing_docs
    public static var router: some Router<EagleRouteV2.Folder> {
        OneOf {
            Route(.case(\.create)) {
                Method.post
                Path { "create" }
                Body(.json(CreateFolder.self))
            }

            Route(.case(\.update)) {
                Method.post
                Path { "update" }
                Body(.json(UpdateFolder.self))
            }

            Route(.case(\.list)) {
                Path { "get" }
                GETPOSTRoute<ListFolders>.router
            }
        }
    }
}

// MARK: Self: Sendable
extension EagleRouteV2.Folder: Sendable {}

// MARK: URLRoutingClient (EX)
public extension URLRoutingClient where Route == EagleAPI.V2.Route {
    @concurrent
    func createFolder(_ draft: CreateFolder) async throws -> CreateFolder.Output {
        try await decodedResponse(for: .folder(.create(draft)), as: CreateFolder.Output.self).value
    }

    @concurrent
    func getFolders(_ query: GETPOSTRoute<ListFolders>) async throws -> ListFolders.Output {
        try await decodedResponse(for: .folder(.list(query)), as: EagleAPI.Response<ListFolders.Output>.self).value.data
    }

    @concurrent
    func updateFolder(_ update: UpdateFolder) async throws -> UpdateFolder.Output {
        try await decodedResponse(for: .folder(.update(update)), as: EagleAPI.Response<UpdateFolder.Output>.self).value.data
    }
}
