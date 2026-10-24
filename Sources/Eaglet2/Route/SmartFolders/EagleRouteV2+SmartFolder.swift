//
//  EagleRouteV2+SmartFolder.swift
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
    enum SmartFolder {
        case fetch(GETPOSTRoute<ListSmartFolders>)
        case create(CreateSmartFolder)
        case update(UpdateSmartFolder)
        case remove(RemoveSmartFolder)
        case items(GetItemsInSmartFolder)
        case ruleSchema
    }
}

// MARK: DotSyntax
public extension EagleRouteV2.SmartFolder {
    static func fetchGet(_ query: ListSmartFolders.GET) -> Self { .fetch(.get(query)) }
    static func fetchPost(_ query: ListSmartFolders.POST) -> Self { .fetch(.post(query)) }
}

// MARK: Self: Equatable
extension EagleRouteV2.SmartFolder: Equatable {}

// MARK: Self: EagleAPI.Routable
extension EagleRouteV2.SmartFolder: EagleAPI.Routable {
    // swiftlint:disable:next missing_docs
    public static var router: some Router<EagleRouteV2.SmartFolder> {
        OneOf {
            Route(.case(\.fetch)) {
                Path { "get" }
                GETPOSTRoute<ListSmartFolders>.router
            }

            Route(.case(\.items)) {
                Method.get
                Path { "getItems" }
                GetItemsInSmartFolder.parser
            }

            Route(.case(\.ruleSchema)) {
                Method.get
                Path { "getRules" }
            }

            Route(.case(\.create)) {
                Method.post
                Path { "create" }
                Body(.json(CreateSmartFolder.self))
            }

            Route(.case(\.update)) {
                Method.post
                Path { "update" }
                Body(.json(UpdateSmartFolder.self))
            }

            Route(.case(\.remove)) {
                Method.post
                Path { "remove" }
                Body(.json(RemoveSmartFolder.self))
            }
        }
    }
}

// MARK: Self: Sendable
extension EagleRouteV2.SmartFolder: Sendable {}

// MARK: URLRoutingClient (EX)
public extension URLRoutingClient where Route == EagleRouteV2 {
    @concurrent
    func fetchSmartFolders(_ query: GETPOSTRoute<ListSmartFolders>) async throws -> [EagleSmartFolder] {
        try await decodedResponse(for: .smartFolder(.fetch(query)), as: EagleAPI.PaginatedResponse<[EagleSmartFolder]>.self).value.data
    }

    @concurrent
    func createSmartFolder(_ create: CreateSmartFolder) async throws -> CreateSmartFolder.Output {
        try await decodedResponse(for: .smartFolder(.create(create)), as: EagleAPI.Response<CreateSmartFolder.Output>.self).value.data
    }

    @concurrent
    func updateSmartFolder(_ update: UpdateSmartFolder) async throws -> UpdateSmartFolder.Output {
        try await decodedResponse(for: .smartFolder(.update(update)), as: EagleAPI.Response<UpdateSmartFolder.Output>.self).value.data
    }

    @concurrent
    func removeSmartFolder(_ remove: RemoveSmartFolder) async throws -> Bool {
        try await decodedResponse(for: .smartFolder(.remove(remove)), as: EagleAPI.Response<Bool>.self).value.data
    }

    @concurrent
    func getItemsInSmartFolder(_ query: GetItemsInSmartFolder) async throws -> GetItemsInSmartFolder.Output {
        try await decodedResponse(for: .smartFolder(.items(query)), as: EagleAPI.PaginatedResponse<GetItemsInSmartFolder.Output>.self).value.data
    }

    @concurrent
    func getRuleSchema() async throws -> RulesSchema {
        try await decodedResponse(for: .smartFolder(.ruleSchema), as: EagleAPI.Response<RulesSchema>.self).value.data
    }
}
