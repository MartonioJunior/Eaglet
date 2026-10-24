//
//  EagleRouteV2.swift
//  Eaglet
//
//  Created by Martônio Júnior on 21/10/2026.
//

public import CasePaths
public import EagletCore
public import URLRouting

@CasePathable
public enum EagleRouteV2 {
    case aiSearch(AISearch)
    case application(Application = .info)
    case folder(Folder)
    case item(Item)
    case library(Library)
    case smartFolder(SmartFolder)
    case tag(Tag)
    case tagGroup(TagGroup)
}

// MARK: Self: Equatable
extension EagleRouteV2: Equatable {}

// MARK: Self: Routable
extension EagleRouteV2: EagleAPI.Routable {
    // swiftlint:disable:next missing_docs
    public static var router: some Router<EagleRouteV2> {
        OneOf {
            Route(.case(\.application.info)) {
                Scheme.http
                Method.get
                Path { "application"; "info" }
            }

            Route(.case(\.aiSearch)) {
                Scheme.http
                Path { "aiSearch" }
                AISearch.router
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

            Route(.case(\.smartFolder)) {
                Scheme.http
                Path { "smartFolder" }
                SmartFolder.router
            }

            Route(.case(\.tag)) {
                Scheme.http
                Path { "tag" }
                Tag.router
            }

            Route(.case(\.tagGroup)) {
                Scheme.http
                Path { "tagGroup" }
                TagGroup.router
            }
        }
    }
}

// MARK: Self: Sendable
extension EagleRouteV2: Sendable {}
