//
//  EagleRouteV2+AISearch.swift
//  Eaglet
//
//  Created by Martônio Júnior on 22/10/2026.
//

public import CasePaths
public import EagletCore
import Foundation
public import Parsing
public import URLRouting

public extension EagleRouteV2 {
    /// Route that performs AI search operations.
    @CasePathable
    enum AISearch {
        case installed
        case ready
        case starting
        case syncing
        case syncStatus
        case serviceHealth
        case search(Query)
    }
}

// MARK: Self.Search
public extension EagleRouteV2.AISearch {
    @CasePathable
    enum Query: Codable, Equatable, Sendable {
        case text(AISearchByText)
        case image(AISearchByImage)
        case itemID(AISearchByItemID)
    }
}

extension EagleRouteV2.AISearch.Query: EagleAPI.Routable {
    // swiftlint:disable:next missing_docs
    public static var router: some Router<EagleRouteV2.AISearch.Query> {
        AnyParserPrinter(
            OneOf {
                Route(.case(\.text)) {
                    Method.post
                    Path { "searchByText" }
                    Body(.json(AISearchByText.self))
                }

                Route(.case(\.image)) {
                    Method.post
                    Path { "searchByBase64" }
                    Body(.json(AISearchByImage.self))
                }

                Route(.case(\.itemID)) {
                    Method.post
                    Path { "searchByItemId" }
                    Body(.json(AISearchByItemID.self))
                }
            }
        )
    }
}

// MARK: Self: Equatable
extension EagleRouteV2.AISearch: Equatable {}

// MARK: Self: Routable
extension EagleRouteV2.AISearch: EagleAPI.Routable {
    // swiftlint:disable:next missing_docs
    public static var router: some Router<EagleRouteV2.AISearch> {
        OneOf {
            Route(.case(\.installed)) {
                Method.get
                Path { "isInstalled" }
            }

            Route(.case(\.ready)) {
                Method.get
                Path { "isReady" }
            }

            Route(.case(\.starting)) {
                Method.get
                Path { "isStarting" }
            }

            Route(.case(\.syncing)) {
                Method.get
                Path { "isSyncing" }
            }

            Route(.case(\.syncStatus)) {
                Method.get
                Path { "getSyncStatus" }
            }

            Route(.case(\.serviceHealth)) {
                Method.get
                Path { "checkServiceHealth" }
            }

            Route(.case(\.search)) {
                Query.router
            }
        }
    }
}

// MARK: Self: Sendable
extension EagleRouteV2.AISearch: Sendable {}

// MARK: URLRoutingClient (EX)
public extension URLRoutingClient where Route == EagleRouteV2 {
    @concurrent
    func isInstalled() async throws -> Bool {
        try await decodedResponse(for: .aiSearch(.installed), as: EagleAPI.Response<Bool>.self).value.data
    }

    @concurrent
    func isReady() async throws -> Bool {
        try await decodedResponse(for: .aiSearch(.ready), as: EagleAPI.Response<Bool>.self).value.data
    }

    @concurrent
    func isStarting() async throws -> Bool {
        try await decodedResponse(for: .aiSearch(.starting), as: EagleAPI.Response<Bool>.self).value.data
    }

    @concurrent
    func isSyncing() async throws -> Bool {
        try await decodedResponse(for: .aiSearch(.syncing), as: EagleAPI.Response<Bool>.self).value.data
    }

    @concurrent
    func aiSearchSyncStatus() async throws -> AISearchSyncStatus {
        try await decodedResponse(for: .aiSearch(.syncStatus), as: EagleAPI.Response<AISearchSyncStatus>.self).value.data
    }

    @concurrent
    func aiSearchServiceHealth() async throws -> AISearchServiceHealth {
        try await decodedResponse(for: .aiSearch(.serviceHealth), as: EagleAPI.Response<AISearchServiceHealth>.self).value.data
    }

    @concurrent
    func aiSearch(byItem query: AISearchByItemID) async throws -> AISearchByItemID.Output {
        try await decodedResponse(for: .aiSearch(.search(.itemID(query))), as: EagleAPI.Response<AISearchByItemID.Output>.self).value.data
    }

    @concurrent
    func aiSearch(byImage query: AISearchByImage) async throws -> AISearchByImage.Output {
        try await decodedResponse(for: .aiSearch(.search(.image(query))), as: EagleAPI.Response<AISearchByImage.Output>.self).value.data
    }

    @concurrent
    func aiSearch(byText query: AISearchByText) async throws -> AISearchByText.Output {
        try await decodedResponse(for: .aiSearch(.search(.text(query))), as: EagleAPI.Response<AISearchByText.Output>.self).value.data
    }
}
