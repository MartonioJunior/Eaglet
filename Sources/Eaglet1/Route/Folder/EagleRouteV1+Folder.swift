//
//  EagleRouteV1+Folder.swift
//  SwiftKnowledge
//
//  Created by Martônio Júnior on 14/04/25.
//

public import CasePaths
public import Common
import Foundation
public import Parsing
public import URLRouting

public extension EagleRouteV1 {
    /// Route that performs a folder operation.
    @CasePathable
    enum Folder {
        /// `POST` Create a folder.
        /// 
        /// The created folder will be put at the bottom of the folder list of the current library.
        case create(CreateFolder)
        /// `POST` Rename the specified folder.
        case rename(RenameFolder)
        /// `POST` Update the specified folder.
        case update(UpdateFolder)
        /// `GET` Obtains a list of folders of the current library.
        case list(ListOptions)
    }
}

// MARK: EagleAPIRoute.Folder.ListOptions
public extension EagleRouteV1.Folder {
    /// Route that defines which folders should be listed.
    @CasePathable
    enum ListOptions {
        /// Gets all folders from the current library.
        case all
        /// Gets only the most recently used folders by the user.
        case recentlyUsed
    }
}

extension EagleRouteV1.Folder.ListOptions: Sendable {}

// MARK: Self: EagleAPI.Routable
extension EagleRouteV1.Folder: EagleAPI.Routable {
    // swiftlint:disable:next missing_docs
    public static var router: some Router<EagleRouteV1.Folder> {
        OneOf {
            Route(.case(\.create)) {
                Method.post
                Path { "create" }
                Body(.json(CreateFolder.self))
            }

            Route(.case(\.rename)) {
                Method.post
                Path { "rename" }
                Body(.json(RenameFolder.self))
            }

            Route(.case(\.update)) {
                Method.post
                Path { "update" }
                Body(.json(UpdateFolder.self))
            }

            Route(.case(\.list.all)) {
                Path { "list" }
            }

            Route(.case(\.list.recentlyUsed)) {
                Path { "listRecent" }
            }
        }
    }
}

// MARK: Self: Sendable
extension EagleRouteV1.Folder: Sendable {}

// MARK: URLRoutingClient (EX)
public extension URLRoutingClient where Route == EagleAPI.V1.Route {
    @concurrent
    func createFolder(_ draft: CreateFolder) async throws -> CreateFolder.Output {
        try await decodedResponse(for: .folder(.create(draft)), as: CreateFolder.Output.self).value
    }

    @concurrent
    func getAllFolders() async throws -> [EagleFolder.ListItem] {
        try await decodedResponse(for: .folder(.list(.all)), as: [EagleFolder.ListItem].self).value
    }

    @concurrent
    func getRecentlyUsedFolders() async throws -> [EagleFolder.RecentItem] {
        try await decodedResponse(for: .folder(.list(.recentlyUsed)), as: [EagleFolder.RecentItem].self).value
    }

    @concurrent
    func renameFolder(_ rename: RenameFolder) async throws -> RenameFolder.Output {
        try await decodedResponse(for: .folder(.rename(rename)), as: RenameFolder.Output.self).value
    }

    @concurrent
    func updateFolder(_ update: UpdateFolder) async throws -> UpdateFolder.Output {
        try await decodedResponse(for: .folder(.update(update)), as: UpdateFolder.Output.self).value
    }
}
