//
//  EagleRouteV2+Item.swift
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
    /// Route that performs an item operation.
    @CasePathable
    enum Item {
        /// `POST` Add item to library (supports URL, file path, Base64, bookmark)
        case add(AddItem)
        /// Fetches items with filters and pagination.
        case list(GETPOSTRoute<ListItems>)
        /// `POST` Full-text search items (supports OR syntax, exclusion)
        case search(SearchItems)
        /// `GET` Number of items in a library.
        case count
        case update(UpdateItem)
        case thumbnail(Thumbnail)
        case comment(Comment)
    }
}

// MARK: DotSyntax
public extension EagleRouteV2.Item {
    /// `GET` Fetches items with simple filters and pagination (use POST for array filters)
    static func fetchGet(_ query: ListItems.GET) -> Self { .list(.get(query)) }
    /// `POST` Fetches items (POST version, suitable for complex filters)
    static func fetchPost(_ query: ListItems.POST) -> Self { .list(.post(query)) }
}

// MARK: Self.Comment
public extension EagleRouteV2.Item {
    @CasePathable
    enum Comment: Codable, Equatable, Sendable {
        case fetchAll(FetchComments)
        /// `POST` Add a comment to an item (image rect or video timestamp)
        case add(AddComment)
        case update(UpdateComment)
        case remove(RemoveComment)
    }
}

extension EagleRouteV2.Item.Comment: EagleAPI.Routable {
    // swiftlint:disable:next missing_docs
    public static var router: some Router<EagleRouteV2.Item.Comment> {
        AnyParserPrinter(
            OneOf {
                Route(.case(\.fetchAll)) {
                    Method.get
                    Path { "getComments" }
                    FetchComments.parser
                }

                Route(.case(\.add)) {
                    Method.post
                    Path { "addComment" }
                    Body(.json(AddComment.self))
                }

                Route(.case(\.update)) {
                    Method.post
                    Path { "updateComment" }
                    Body(.json(UpdateComment.self))
                }

                Route(.case(\.remove)) {
                    Method.post
                    Path { "removeComment" }
                    Body(.json(RemoveComment.self))
                }
            }
        )
    }
}

// MARK: Self.Thumbnail
public extension EagleRouteV2.Item {
    @CasePathable
    enum Thumbnail: Codable, Equatable, Sendable {
        /// `POST` Sets a custom thumbnail for a file.
        case custom(SetCustomThumbnail)
        /// `POST` Regenerate thumbnail
        case refresh(RefreshThumbnail)
    }
}

extension EagleRouteV2.Item.Thumbnail: EagleAPI.Routable {
    // swiftlint:disable:next missing_docs
    public static var router: some Router<EagleRouteV2.Item.Thumbnail> {
        AnyParserPrinter(
            OneOf {
                Route(.case(\.custom)) {
                    Method.post
                    Path { "setCustomThumbnail" }
                    Body(.json(SetCustomThumbnail.self))
                }

                Route(.case(\.refresh)) {
                    Method.post
                    Path { "refreshThumbnail" }
                    Body(.json(RefreshThumbnail.self))
                }
            }
        )
    }
}

// MARK: Self: Equatable
extension EagleRouteV2.Item: Equatable {}

// MARK: Self: Routable
extension EagleRouteV2.Item: EagleAPI.Routable {
    // swiftlint:disable:next missing_docs
    public static var router: some Router<EagleRouteV2.Item> {
        OneOf {
            Route(.case(\.add)) {
                Method.post
                Path { "add" }
                Body(.json(AddItem.self))
            }

            Route(.case(\.list)) {
                Path { "get" }
                GETPOSTRoute<ListItems>.router
            }

            Route(.case(\.search)) {
                Method.post
                Path { "query" }
                Body(.json(SearchItems.self))
            }

            Route(.case(\.count)) {
                Method.get
                Path { "countAll" }
            }

            Route(.case(\.update)) {
                Method.post
                Path { "update" }
                Body(.json(UpdateItem.self))
            }

            Route(.case(\.thumbnail)) {
                Thumbnail.router
            }

            Route(.case(\.comment)) {
                Comment.router
            }
        }
    }
}

// MARK: Self: Sendable
extension EagleRouteV2.Item: Sendable {}

// MARK: URLRoutingClient (EX)
public extension URLRoutingClient where Route == EagleRouteV2 {
    @concurrent
    func addComment(_ comment: AddComment) async throws -> EagleComment {
        try await decodedResponse(for: .item(.comment(.add(comment))), as: EagleAPI.Response<EagleComment>.self).value.data
    }

    @concurrent
    func addItem(_ add: AddItem) async throws -> AddItem.Output {
        try await decodedResponse(for: .item(.add(add)), as: EagleAPI.Response<AddItem.Output>.self).value.data
    }

    @concurrent
    func fetchComments(_ query: FetchComments) async throws -> FetchComments.Output {
        try await decodedResponse(for: .item(.comment(.fetchAll(query))), as: EagleAPI.Response<FetchComments.Output>.self).value.data
    }

    @concurrent
    func fetchItem(_ query: GETPOSTRoute<ListItems>) async throws -> [EagleItem] {
        try await decodedResponse(for: .item(.list(query)), as: EagleAPI.PaginatedResponse<[EagleItem]>.self).value.data
    }

    @concurrent
    func numberOfItems() async throws -> UInt {
        try await decodedResponse(for: .item(.count), as: EagleAPI.Response<UInt>.self).value.data
    }

    @concurrent
    func refreshThumbnail(_ thumbnail: RefreshThumbnail) async throws -> Bool {
        try await decodedResponse(for: .item(.thumbnail(.refresh(thumbnail))), as: EagleAPI.Response<Bool>.self).value.data
    }

    @concurrent
    func removeComment(_ comment: RemoveComment) async throws -> RemoveComment.Output {
        try await decodedResponse(for: .item(.comment(.remove(comment))), as: EagleAPI.Response<RemoveComment.Output>.self).value.data
    }

    @concurrent
    func searchItems(_ query: SearchItems) async throws -> [EagleItem] {
        try await decodedResponse(for: .item(.search(query)), as: EagleAPI.PaginatedResponse<[EagleItem]>.self).value.data
    }

    @concurrent
    func setThumbnail(_ thumbnail: SetCustomThumbnail) async throws -> Bool {
        try await decodedResponse(for: .item(.thumbnail(.custom(thumbnail))), as: EagleAPI.Response<Bool>.self).value.data
    }

    @concurrent
    func update(_ update: UpdateItem) async throws -> UpdateItem.Output {
        try await decodedResponse(for: .item(.update(update)), as: EagleAPI.Response<UpdateItem.Output>.self).value.data
    }

    @concurrent
    func updateComment(_ comment: UpdateComment) async throws -> UpdateComment.Output {
        try await decodedResponse(for: .item(.comment(.update(comment))), as: EagleAPI.Response<UpdateComment.Output>.self).value.data
    }
}
