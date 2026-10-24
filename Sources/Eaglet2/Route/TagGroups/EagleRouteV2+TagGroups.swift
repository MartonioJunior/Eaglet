//
//  EagleRouteV2+TagGroups.swift
//  Eaglet
//
//  Created by Martônio Júnior on 21/10/2026.
//

public import CasePaths
public import EagletCore
public import URLRouting

public extension EagleRouteV2 {
    /// Route used to perform operations on tag groups from an Eagle library.
    @CasePathable
    enum TagGroup {
        case get(EagleAPI.Pagination)
        case create(CreateTagGroup)
        case update(UpdateTagGroup)
        case remove(RemoveTagGroup)
        case addTags(AddTagsToTagGroup)
        case removeTags(RemoveTagsFromTagGroup)
    }
}

// MARK: Self: Equatable
extension EagleRouteV2.TagGroup: Equatable {}

// MARK: Self: EagleAPI.Routable
extension EagleRouteV2.TagGroup: EagleAPI.Routable {
    // swiftlint:disable:next missing_docs
    public static var router: some Router<EagleRouteV2.TagGroup> {
        OneOf {
            Route(.case(\.get)) {
                Method.get
                Path { "get" }
                EagleAPI.Pagination.parser
            }

            Route(.case(\.create)) {
                Method.post
                Path { "create" }
                Body(.json(CreateTagGroup.self))
            }

            Route(.case(\.update)) {
                Method.post
                Path { "update" }
                Body(.json(UpdateTagGroup.self))
            }

            Route(.case(\.remove)) {
                Method.post
                Path { "remove" }
                Body(.json(RemoveTagGroup.self))
            }

            Route(.case(\.addTags)) {
                Method.post
                Path { "addTags" }
                Body(.json(AddTagsToTagGroup.self))
            }

            Route(.case(\.removeTags)) {
                Method.post
                Path { "removeTags" }
                Body(.json(RemoveTagsFromTagGroup.self))
            }
        }
    }
}

// MARK: Self: Sendable
extension EagleRouteV2.TagGroup: Sendable {}

// MARK: URLRoutingClient (EX)
public extension URLRoutingClient where Route == EagleRouteV2 {
    @concurrent
    func getTagGroups(_ query: EagleAPI.Pagination) async throws -> [EagleTagGroup] {
        try await decodedResponse(for: .tagGroup(.get(query)), as: EagleAPI.PaginatedResponse<[EagleTagGroup]>.self).value.data
    }

    @concurrent
    func createTagGroup(_ create: CreateTagGroup) async throws -> CreateTagGroup.Output {
        try await decodedResponse(for: .tagGroup(.create(create)), as: EagleAPI.Response<CreateTagGroup.Output>.self).value.data
    }

    @concurrent
    func updateTagGroup(_ update: UpdateTagGroup) async throws -> UpdateTagGroup.Output {
        try await decodedResponse(for: .tagGroup(.update(update)), as: EagleAPI.Response<UpdateTagGroup.Output>.self).value.data
    }

    @concurrent
    func removeTagGroup(_ remove: RemoveTagGroup) async throws -> RemoveTagGroup.Output {
        try await decodedResponse(for: .tagGroup(.remove(remove)), as: EagleAPI.Response<RemoveTagGroup.Output>.self).value.data
    }

    @concurrent
    func addTagsToGroup(_ addition: AddTagsToTagGroup) async throws -> AddTagsToTagGroup.Output {
        try await decodedResponse(for: .tagGroup(.addTags(addition)), as: EagleAPI.Response<AddTagsToTagGroup.Output>.self).value.data
    }

    @concurrent
    func removeTagsFromGroup(_ removal: RemoveTagsFromTagGroup) async throws -> RemoveTagsFromTagGroup.Output {
        try await decodedResponse(for: .tagGroup(.removeTags(removal)), as: EagleAPI.Response<RemoveTagsFromTagGroup.Output>.self).value.data
    }
}
