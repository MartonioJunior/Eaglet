//
//  EagleAPIRoute+Folder.swift
//  SwiftKnowledge
//
//  Created by Martônio Júnior on 14/04/25.
//

public import CasePaths
public import Common
import Foundation
public import Parsing
public import URLRouting

public extension EagleAPIRoute {
    @CasePathable
    enum Folder {
        case create(CreateFolder)
        case rename(RenameFolder)
        case update(UpdateFolder)
        case list(ListOptions)
    }
}

// MARK: EagleAPIRoute.Folder.ListOptions
public extension EagleAPIRoute.Folder {
    @CasePathable
    enum ListOptions {
        case all
        case recentlyUsed
    }
}

extension EagleAPIRoute.Folder.ListOptions: Sendable {}

// MARK: Self: EagleAPI.Routable
extension EagleAPIRoute.Folder: EagleAPI.Routable {
    // swiftlint:disable:next missing_docs
    public static var router: some Router<EagleAPIRoute.Folder> {
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
extension EagleAPIRoute.Folder: Sendable {}
