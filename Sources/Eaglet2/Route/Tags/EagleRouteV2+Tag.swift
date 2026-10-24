//
//  EagleRouteV2+Tag.swift
//  Eaglet
//
//  Created by Martônio Júnior on 21/10/2026.
//

public import CasePaths
public import EagletCore
public import URLRouting

public extension EagleRouteV2 {
    /// Route used to perform operations on tags from an Eagle library.
    @CasePathable
    enum Tag {
        case list(GETPOSTRoute<ListTags>)
        case recentTags(EagleAPI.Pagination)
        case starredTags(EagleAPI.Pagination)
        case merge(MergeTags)
        case update(UpdateTags)
    }
}

// MARK: DotSyntax
public extension EagleRouteV2.Tag {
    static func tagGet(_ query: ListTags) -> Self { .list(.get(query)) }
    static func tagPost(_ query: ListTags) -> Self { .list(.post(query)) }
}

// MARK: Self: Equatable
extension EagleRouteV2.Tag: Equatable {}

// MARK: Self: EagleAPI.Routable
extension EagleRouteV2.Tag: EagleAPI.Routable {
    // swiftlint:disable:next missing_docs
    public static var router: some Router<EagleRouteV2.Tag> {
        OneOf {
            Route(.case(\.list)) {
                Path { "get" }
                GETPOSTRoute<ListTags>.router
            }

            Route(.case(\.recentTags)) {
                Method.get
                Path { "getRecentTags" }
                EagleAPI.Pagination.parser
            }

            Route(.case(\.starredTags)) {
                Method.get
                Path { "getStarredTags" }
                EagleAPI.Pagination.parser
            }

            Route(.case(\.merge)) {
                Method.post
                Path { "merge" }
                Body(.json(MergeTags.self))
            }

            Route(.case(\.update)) {
                Method.post
                Path { "update" }
                Body(.json(UpdateTags.self))
            }
        }
    }
}

// MARK: Self: Sendable
extension EagleRouteV2.Tag: Sendable {}

// MARK: URLRoutingClient (EX)
public extension URLRoutingClient where Route == EagleRouteV2 {
    @concurrent
    func listTags(_ query: GETPOSTRoute<ListTags>) async throws -> ListTags.Output {
        try await decodedResponse(for: .tag(.list(query)), as: EagleAPI.Response<ListTags.Output>.self).value.data
    }

    @concurrent
    func recentTags(_ query: EagleAPI.Pagination) async throws -> ListTags.Output {
        try await decodedResponse(for: .tag(.recentTags(query)), as: EagleAPI.Response<ListTags.Output>.self).value.data
    }

    @concurrent
    func starredTags(_ query: EagleAPI.Pagination) async throws -> ListTags.Output {
        try await decodedResponse(for: .tag(.starredTags(query)), as: EagleAPI.Response<ListTags.Output>.self).value.data
    }

    @concurrent
    func mergeTags(_ merge: MergeTags) async throws -> MergeTags.Output {
        try await decodedResponse(for: .tag(.merge(merge)), as: EagleAPI.Response<MergeTags.Output>.self).value.data
    }

    @concurrent
    func updateTags(_ update: UpdateTags) async throws -> UpdateTags.Output {
        try await decodedResponse(for: .tag(.update(update)), as: EagleAPI.Response<UpdateTags.Output>.self).value.data
    }
}
