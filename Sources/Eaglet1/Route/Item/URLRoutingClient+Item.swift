//
//  URLRoutingClient+Item.swift
//  Eaglet
//
//  Created by Martônio Júnior on 10/10/2026.
//

import EagletCore
import URLRouting

public extension URLRoutingClient where Route == EagleRouteV1 {
    @concurrent
    func addBookmark(_ bookmark: AddBookmark) async throws -> EagleAPI.VoidResponse {
        try await request(.item(.add(.bookmark(bookmark))))
    }

    @concurrent
    func addManyPath(_ items: some Sequence<AddPathItem>, toFolder folderID: EagleFolder.ID? = nil) async throws -> EagleAPI.VoidResponse {
        try await request(.item(.add(.manyPath(.init(items: items.map { .path($0) }, folderID: folderID)))))
    }


    @concurrent
    func addManyURL(_ items: some Sequence<AddURLItem>, toFolder folderID: EagleFolder.ID? = nil) async throws -> EagleAPI.VoidResponse {
        try await request(.item(.add(.manyURL(.init(items: items.map { .url($0) }, folderID: folderID)))))
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
