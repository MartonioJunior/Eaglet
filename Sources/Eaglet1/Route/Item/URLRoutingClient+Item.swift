//
//  URLRoutingClient+Item.swift
//  Eaglet
//
//  Created by Martônio Júnior on 10/10/2026.
//

import Common
import URLRouting

public extension URLRoutingClient where Route == EagleRouteV1 {
    @concurrent
    func addBookmark(_ bookmark: AddBookmark) async throws -> EagleAPI.VoidResponse {
        try await request(.item(.add(.bookmark(bookmark))))
    }

    @concurrent
    func addManyItems(_ items: AddManyItems) async throws -> EagleAPI.VoidResponse {
        try await request(.item(.add(.many(items))))
    }

    @concurrent
    func addPathItem(_ item: AddPathItem) async throws -> EagleAPI.VoidResponse {
        try await request(.item(.add(.one(.path(item)))))
    }

    @concurrent
    func addURLItem(_ item: AddURLItem) async throws -> EagleAPI.VoidResponse {
        try await request(.item(.add(.one(.url(item)))))
    }

    @concurrent
    func listItems(_ query: ListItems = .init()) async throws -> [EagleItem] {
        try await decodedResponse(for: .item(.list(query)), as: EagleAPI.Response<[EagleItem]>.self).value.data
    }

    @concurrent
    func moveToTrash(_ items: MoveToTrash) async throws -> EagleAPI.VoidResponse {
        try await request(.item(.moveToTrash(items)))
    }

    @concurrent
    func refreshThumbnail(forID itemID: EagleItem.ID) async throws -> EagleAPI.VoidResponse {
        try await request(.item(.refresh(.thumbnail(.init(id: itemID)))))
    }

    @concurrent
    func setCustomThumbnail(_ thumbnail: SetCustomThumbnail) async throws -> EagleAPI.VoidResponse {
        try await request(.item(.setCustomThumbnail(thumbnail)))
    }

    @concurrent
    func updateItem(_ item: UpdateItem) async throws -> EagleItem {
        try await decodedResponse(for: .item(.update(item)), as: EagleAPI.Response<UpdateItem.Output>.self).value.data
    }
}
