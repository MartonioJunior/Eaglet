//
//  EagleRouteV1+Item+Tests.swift
//  Eaglet
//
//  Created by Martônio Júnior on 10/10/2026.
//

import EagletCore
import CustomDump
@testable import Eaglet1
import Foundation
import Testing
import URLRouting

struct EagletRouteV1ItemTests {
    @Test("Adds a new bookmark", arguments: [
        (
            AddBookmark(
                url: "https://www.pixiv.net/artworks/83585181",
                name: "Cool Artwork",
                base64: "some-image-data",
                tags: ["FGO", "Artworks"],
                modificationTime: 17484738574,
                folderID: "KBKE02W8V0YWD"
            ),
            EagleAPI.VoidResponse("success")
        )
    ])
    func addBookmark(_ bookmark: AddBookmark, expected: EagleAPI.VoidResponse) async throws {
        let client: URLRoutingClient<EagleRouteV1> = .failing.override {
            guard case .item(.add(.bookmark)) = $0 else { return false }
            return true
        } with: {
            try .ok(expected)
        }

        let result = try await client.addBookmark(bookmark)

        expectNoDifference(result, expected)
    }

    @Test("Adds multiple path items at once", arguments: [
        (
            [
                AddPathItem(
                    path: "C://Users/User/Downloads/test.jpg",
                    name: "アルトリア･キャスター",
                    website: "https://www.pixiv.net/artworks/83585181",
                    annotation: "久坂んむり",
                    tags: ["FGO", "アルトリア・キャスター"],
                ),
                AddPathItem(
                    path: "C://Users/User/Downloads/test2.jpg",
                    name: "アルトリア･キャスター",
                    website: "https://www.pixiv.net/artworks/83585181",
                    annotation: "久坂んむり",
                    tags: ["FGO", "アルトリア・キャスター"],
                )
            ],
            "KEHB8I2C9F23H",
            EagleAPI.VoidResponse("success")
        )
    ])
    func addManyPath(_ items: [AddPathItem], toFolder folderID: EagleFolder.ID?, expected: EagleAPI.VoidResponse) async throws {
        let client: URLRoutingClient<EagleRouteV1> = .failing.override {
            guard case .item(.add(.manyPath)) = $0 else { return false }
            return true
        } with: {
            try .ok(expected)
        }

        let result = try await client.addManyPath(items, toFolder: folderID)

        expectNoDifference(result, expected)
    }

    @Test("Adds multiple path items at once", arguments: [
        (
            [
                AddURLItem(
                    url: "https://cdn.dribbble.com/users/674925/screenshots/12020761/media/6420a7ec85751c11e5254282d6124950.png",
                    name: "Work",
                    website: "https://dribbble.com/shots/12020761-Work",
                    tags: ["Illustration", "Design"],
                    modificationTime: 1591325171767,
                    headers: ["referer": "dribbble.com"]
                ),
                AddURLItem(
                    url: "https://cdn.dribbble.com/users/674925/screenshots/12061400/media/71da9ba40c47f09d8cd6953d661e61fd.png",
                    name: "Work2",
                    website:  "https://dribbble.com/shots/12061400-work2",
                    tags: ["Illustration", "Design"],
                    modificationTime: 1591325171766,
                    headers: ["referer": "dribbble.com"]
                )
            ],
            "KEHB8I2C9F23H",
            EagleAPI.VoidResponse("success")
        )
    ])
    func addManyURL(_ items: [AddURLItem], toFolder folderID: EagleFolder.ID?, expected: EagleAPI.VoidResponse) async throws {
        let client: URLRoutingClient<EagleRouteV1> = .failing.override {
            guard case .item(.add(.manyURL)) = $0 else { return false }
            return true
        } with: {
            try .ok(expected)
        }

        let result = try await client.addManyURL(items, toFolder: folderID)

        expectNoDifference(result, expected)
    }

    @Test("Adds a new path item", arguments: [
        (
            AddPathItem(
                path: "C://Users/User/Downloads/test.jpg",
                name: "アルトリア･キャスター",
                website: "https://www.pixiv.net/artworks/83585181",
                annotation: "久坂んむり",
                tags: ["FGO", "アルトリア・キャスター"],
                folderID: "KEHB8I2C9F23H"
            ),
            EagleAPI.VoidResponse("success")
        )
    ])
    func addPathItem(_ item: AddPathItem, expected: EagleAPI.VoidResponse) async throws {
        let client: URLRoutingClient<EagleRouteV1> = .failing.override {
            guard case .item(.add(.one(.path))) = $0 else { return false }
            return true
        } with: {
            try .ok(expected)
        }

        let result = try await client.addPathItem(item)

        expectNoDifference(result, expected)
    }

    @Test("Adds a new URL item", arguments: [
        (
            AddURLItem(
                url: "https://cdn.dribbble.com/users/674925/screenshots/12020761/media/6420a7ec85751c11e5254282d6124950.png",
                name: "Work",
                website: "https://dribbble.com/shots/12020761-Work",
                tags: ["Illustration", "Design"],
                star: 4,
                annotation: "An annotation",
                modificationTime: 1591325171766,
                folderID: "KBJJSMMVF9WYL",
                headers: ["referer": "dribbble.com"]
            ),
            EagleAPI.VoidResponse("success")
        )
    ])
    func addURLItem(_ item: AddURLItem, expected: EagleAPI.VoidResponse) async throws {
        let client: URLRoutingClient<EagleRouteV1> = .failing.override {
            guard case .item(.add(.one(.url))) = $0 else { return false }
            return true
        } with: {
            try .ok(expected)
        }

        let result = try await client.addURLItem(item)

        expectNoDifference(result, expected)
    }

    @Test("Obtains a list of items", arguments: [
        (
            ListItems(
                limit: 30,
                offset: 5,
                orderBy: .init(.ascending, .fileSize),
                keyword: "ball",
                extensionType: "jpg",
                tags: ["Design", "Goal"],
                folders: ["KAY6NTU6UYI5Q", "KBJ8Z60O88VMG"]
            ), EagleAPI.Response<[EagleItem]>(
                [
                    EagleItem(
                        id: "MUIPQZWJQQ0WQ",
                        name: "Hades in Concert - Ballads of the Underworld (Concert Video) - YouTube",
                        size: 72,
                        btime: 1790446721354,
                        mtime: 1790446721355,
                        ext: "url",
                        tags: [
                            "Complete Soundtrack",
                            "Resampled"
                        ],
                        folders: ["LW2AWVT13PF86"],
                        isDeleted: false,
                        url: "https://www.youtube.com/watch?v=fvGSQFZWcwM",
                        annotation: "",
                        modificationTime: 1790446721347,
                        width: 480,
                        height: 360,
                        videoID: "fvGSQFZWcwM",
                        medium: "youtube",
                        duration: .init(5999),
                        lastModified: 1790446722027,
                        palettes: [
                            EagleItem.PaletteColor(color: [16, 12, 9], ratio: 50),
                            EagleItem.PaletteColor(color: [71, 48, 38], ratio: 19),
                            EagleItem.PaletteColor(color: [118, 82, 69], ratio: 12),
                            EagleItem.PaletteColor(color: [181, 148, 138], ratio: 5),
                            EagleItem.PaletteColor(color: [71, 64, 79], ratio: 4.32),
                            EagleItem.PaletteColor(color: [112, 163, 155], ratio: 3.09),
                            EagleItem.PaletteColor(color: [82, 95, 91], ratio: 2.82),
                            EagleItem.PaletteColor(color: [113, 131, 138], ratio: 1.34),
                            EagleItem.PaletteColor(color: [192, 216, 189], ratio: 1.27),
                            EagleItem.PaletteColor(color: [165, 125, 61], ratio: 0.4)
                        ]
                    )
                ],
                status: "success"
            )
        )
    ])
    func listItems(_ query: ListItems, expected: EagleAPI.Response<[EagleItem]>) async throws {
        let client: URLRoutingClient<EagleRouteV1> = .failing.override(.item(.list(query))) {
            try .ok(expected)
        }

        let result = try await client.listItems(query)

        expectNoDifference(result, expected.data)
    }

    @Test("Moves items to the trash", arguments: [
        (
            MoveToTrash(itemIds: ["KWLKGQW2HTHC7", "KWLOGLTX0FGHF"]),
            EagleAPI.VoidResponse("success")
        )
    ])
    func moveToTrash(_ items: MoveToTrash, expected: EagleAPI.VoidResponse) async throws {
        let client: URLRoutingClient<EagleRouteV1> = .failing.override {
            guard case .item(.moveToTrash) = $0 else { return false }
            return true
        } with: {
            try .ok(expected)
        }

        let result = try await client.moveToTrash(items)

        expectNoDifference(result, expected)
    }

    @Test("Refreshes the thumbnail for an item", arguments: [
        (
            "KWLKGQW2HTHC7",
            EagleAPI.VoidResponse("success")
        )
    ])
    func refreshThumbnail(forID itemID: EagleItem.ID, expected: EagleAPI.VoidResponse) async throws {
        let client: URLRoutingClient<EagleRouteV1> = .failing.override {
            guard case .item(.refresh(.thumbnail)) = $0 else { return false }
            return true
        } with: {
            try .ok(expected)
        }

        let result = try await client.refreshThumbnail(forID: itemID)

        expectNoDifference(result, expected)
    }

    @Test("Updates the thumbnail of an item", arguments: [
        (
            SetCustomThumbnail(),
            EagleAPI.VoidResponse("success")
        )
    ])
    func setCustomThumbnail(_ thumbnail: SetCustomThumbnail, expected: EagleAPI.VoidResponse) async throws {
        let client: URLRoutingClient<EagleRouteV1> = .failing.override {
            guard case .item(.setCustomThumbnail) = $0 else { return false }
            return true
        } with: {
            try .ok(expected)
        }

        let result = try await client.setCustomThumbnail(thumbnail)

        expectNoDifference(result, expected)
    }

    @Test("Updates information for an item", arguments: [
        (
            UpdateItem(
                id: "KBN1X9NHDZ99F",
                tags: ["Design1", "Design2"],
                annotation: "Awesome",
                url: "https://dribbble.com",
                star: 4
            ),
            EagleAPI.Response<UpdateItem.Output>(
                UpdateItem.Output(
                    id: "KBN1X9NHDZ99F",
                    name: "Top Character Design Trends for 2019 Bold Impressive",
                    size: 18447,
                    ext: "jpg",
                    tags: ["Design1", "Design2"],
                    folders: ["KBJJSMMVF9WYL"],
                    isDeleted: false,
                    url: "https://dribbble.com",
                    annotation: "Awesome",
                    modificationTime: 1592621841437,
                    width: 450,
                    height: 545,
                    noThumbnail: true,
                    lastModified: 1592625558780,
                    palettes: [
                        EagleItem.PaletteColor(color: [251, 244, 221], ratio: 80, hashKey: "object:678"),
                        EagleItem.PaletteColor(color: [10, 185, 202], ratio: 7, hashKey: "object:679"),
                        EagleItem.PaletteColor(color: [26, 37, 64], ratio: 6, hashKey: "object:680"),
                        EagleItem.PaletteColor(color: [217, 83, 11], ratio: 4.42, hashKey: "object:681"),
                        EagleItem.PaletteColor(color: [242, 200, 172], ratio: 0.51, hashKey: "object:682"),
                        EagleItem.PaletteColor(color: [214, 170, 135], ratio: 0.44, hashKey: "object:683"),
                        EagleItem.PaletteColor(color: [154, 208, 220], ratio: 0.31, hashKey: "object:684"),
                    ],
                    star: 4
                ),
                status: "success"
            )
        )
    ])
    func updateItem(_ item: UpdateItem, expected: EagleAPI.Response<EagleItem>) async throws {
        let client: URLRoutingClient<EagleRouteV1> = .failing.override {
            guard case .item(.update) = $0 else { return false }
            return true
        } with: {
            try .ok(expected)
        }

        let result = try await client.updateItem(item)

        expectNoDifference(result, expected.data)
    }
}
