//
//  EagleRouteV1+Tests.swift
//  Eaglet
//
//  Created by Martônio Júnior on 08/10/2026.
//

import CustomDump
@testable import Eaglet1
import Foundation
import Testing
import URLRouting

struct EagleRouteV1Tests {
    struct ConformsToRoutable {
        @Test("Evaluates router printing", arguments: [
            (EagleRouteV1.application(.info), URLRequestData.get(path: "/application/info")),
            (
                EagleRouteV1.folder(.create(.init(named: "New Folder"))),
                URLRequestData.post(
                    path: "/folder/create",
                    body: {
                        let body = CreateFolder(named: "New Folder")
                        return try? JSONEncoder().encode(body)
                    }()
                )
            ),
            (
                EagleRouteV1.folder(.rename(.init(id: "KBJJSMMVF9WYL", newName: "New Folder"))),
                URLRequestData.post(
                    path: "/folder/rename",
                    body: {
                        let body = RenameFolder(id: "KBJJSMMVF9WYL", newName: "New Folder")
                        return try? JSONEncoder().encode(body)
                    }()
                )
            ),
            (
                EagleRouteV1.folder(.update(
                    .init(
                        id: "KBJJSMMVF9WYL",
                        newName: "New Folder",
                        newDescription: "Cool Description",
                        newColor: .init(rawValue: "red")
                    )
                )),
                URLRequestData.post(
                    path: "/folder/update",
                    body: {
                        let body = UpdateFolder(
                            id: "KBJJSMMVF9WYL",
                            newName: "New Folder",
                            newDescription: "Cool Description",
                            newColor: .init(rawValue: "red")
                        )
                        return try? JSONEncoder().encode(body)
                    }()
                )
            ),
            (
                EagleRouteV1.folder(.list(.all)),
                URLRequestData.get(path: "/folder/list")
            ),
            (
                EagleRouteV1.folder(.list(.recentlyUsed)),
                URLRequestData.get(path: "/folder/listRecent")
            ),
            (
                EagleRouteV1.item(.add(.bookmark(
                    AddBookmark(
                        url: "https://www.pixiv.net/artworks/83585181",
                        name: "Cool Artwork",
                        base64: "some-image-data",
                        tags: ["FGO", "Artworks"],
                        modificationTime: 17484738574,
                        folderID: "KBKE02W8V0YWD"
                    )
                ))),
                URLRequestData.post(
                    path: "/item/addBookmark",
                    body: {
                        let body = AddBookmark(
                            url: "https://www.pixiv.net/artworks/83585181",
                            name: "Cool Artwork",
                            base64: "some-image-data",
                            tags: ["FGO", "Artworks"],
                            modificationTime: 17484738574,
                            folderID: "KBKE02W8V0YWD"
                        )
                        return try? JSONEncoder().encode(body)
                    }()
                )
            ),
            (
                EagleRouteV1.item(.add(.one(.url(
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
                    )
                )))),
                URLRequestData.post(
                    path: "/item/addFromURL",
                    body: {
                        let body = AddURLItem(
                            url: "https://cdn.dribbble.com/users/674925/screenshots/12020761/media/6420a7ec85751c11e5254282d6124950.png",
                            name: "Work",
                            website: "https://dribbble.com/shots/12020761-Work",
                            tags: ["Illustration", "Design"],
                            star: 4,
                            annotation: "An annotation",
                            modificationTime: 1591325171766,
                            folderID: "KBJJSMMVF9WYL",
                            headers: ["referer": "dribbble.com"]
                        )
                        return try? JSONEncoder().encode(body)
                    }()
                )
            ),
            (
                EagleRouteV1.item(.add(.one(.path(
                    AddPathItem(
                        path: "C://Users/User/Downloads/test.jpg",
                        name: "アルトリア･キャスター",
                        website: "https://www.pixiv.net/artworks/83585181",
                        annotation: "久坂んむり",
                        tags: ["FGO", "アルトリア・キャスター"],
                        folderID: "KEHB8I2C9F23H"
                    )
                )))),
                URLRequestData.post(
                    path: "/item/addFromPath",
                    body: {
                        let body = AddPathItem(
                            path: "C://Users/User/Downloads/test.jpg",
                            name: "アルトリア･キャスター",
                            website: "https://www.pixiv.net/artworks/83585181",
                            annotation: "久坂んむり",
                            tags: ["FGO", "アルトリア・キャスター"],
                            folderID: "KEHB8I2C9F23H"
                        )
                        return try? JSONEncoder().encode(body)
                    }()
                )
            ),
            (
                EagleRouteV1.item(.add(.manyURL(
                    AddManyItems(
                        items: [
                            .url(
                                AddURLItem(
                                    url: "https://cdn.dribbble.com/users/674925/screenshots/12020761/media/6420a7ec85751c11e5254282d6124950.png",
                                    name: "Work",
                                    website: "https://dribbble.com/shots/12020761-Work",
                                    tags: ["Illustration", "Design"],
                                    modificationTime: 1591325171767,
                                    headers: ["referer": "dribbble.com"]
                                )
                            ),
                            .url(
                                AddURLItem(
                                    url: "https://cdn.dribbble.com/users/674925/screenshots/12061400/media/71da9ba40c47f09d8cd6953d661e61fd.png",
                                    name: "Work2",
                                    website:  "https://dribbble.com/shots/12061400-work2",
                                    tags: ["Illustration", "Design"],
                                    modificationTime: 1591325171766,
                                    headers: ["referer": "dribbble.com"]
                                )
                            )
                        ],
                        folderID: "KAY6NTU6UYI5Qa"
                    )
                ))),
                URLRequestData.post(
                    path: "/item/addFromURLs",
                    body: {
                        let body = AddManyItems(
                            items: [
                                .url(
                                    AddURLItem(
                                        url: "https://cdn.dribbble.com/users/674925/screenshots/12020761/media/6420a7ec85751c11e5254282d6124950.png",
                                        name: "Work",
                                        website: "https://dribbble.com/shots/12020761-Work",
                                        tags: ["Illustration", "Design"],
                                        modificationTime: 1591325171767,
                                        headers: ["referer": "dribbble.com"]
                                    )
                                ),
                                .url(
                                    AddURLItem(
                                        url: "https://cdn.dribbble.com/users/674925/screenshots/12061400/media/71da9ba40c47f09d8cd6953d661e61fd.png",
                                        name: "Work2",
                                        website:  "https://dribbble.com/shots/12061400-work2",
                                        tags: ["Illustration", "Design"],
                                        modificationTime: 1591325171766,
                                        headers: ["referer": "dribbble.com"]
                                    )
                                )
                            ],
                            folderID: "KAY6NTU6UYI5Qa"
                        )
                        return try? JSONEncoder().encode(body)
                    }()
                )
            ),
            (
                EagleRouteV1.item(.add(.manyPath(
                    AddManyItems(
                        items: [
                            .path(
                                AddPathItem(
                                    path: "C://Users/User/Downloads/test.jpg",
                                    name: "アルトリア･キャスター",
                                    website: "https://www.pixiv.net/artworks/83585181",
                                    annotation: "久坂んむり",
                                    tags: ["FGO", "アルトリア・キャスター"],
                                )
                            ),
                            .path(
                                AddPathItem(
                                    path: "C://Users/User/Downloads/test2.jpg",
                                    name: "アルトリア･キャスター",
                                    website: "https://www.pixiv.net/artworks/83585181",
                                    annotation: "久坂んむり",
                                    tags: ["FGO", "アルトリア・キャスター"],
                                )
                            )
                        ],
                        folderID: "KAY6NTU6UYI5Qa"
                    )
                ))),
                URLRequestData.post(
                    path: "/item/addFromPaths",
                    body: {
                        let body = AddManyItems(
                            items: [
                                .path(
                                    AddPathItem(
                                        path: "C://Users/User/Downloads/test.jpg",
                                        name: "アルトリア･キャスター",
                                        website: "https://www.pixiv.net/artworks/83585181",
                                        annotation: "久坂んむり",
                                        tags: ["FGO", "アルトリア・キャスター"],
                                    )
                                ),
                                .path(
                                    AddPathItem(
                                        path: "C://Users/User/Downloads/test2.jpg",
                                        name: "アルトリア･キャスター",
                                        website: "https://www.pixiv.net/artworks/83585181",
                                        annotation: "久坂んむり",
                                        tags: ["FGO", "アルトリア・キャスター"],
                                    )
                                )
                            ],
                            folderID: "KAY6NTU6UYI5Qa"
                        )
                        return try? JSONEncoder().encode(body)
                    }()
                )
            ),
            (
                EagleRouteV1.item(.info("KAY6NTU6UYI5Q")),
                URLRequestData.get(path: "/item/info", query: [
                    "id": ["KAY6NTU6UYI5Q"]
                ])
            ),
            (
                EagleRouteV1.item(.thumbnail("KAY6NTU6UYI5Q")),
                URLRequestData.get(path: "/item/thumbnail", query: [
                    "id": ["KAY6NTU6UYI5Q"]
                ])
            ),
            (
                EagleRouteV1.item(.list(
                    ListItems(
                        limit: 60,
                        offset: 6,
                        orderBy: .init(.ascending, .resolution),
                        keyword: "ball",
                        extensionType: "jpg",
                        tags: ["Design", "Goal"],
                        folders: ["KAY6NTU6UYI5Q", "KBJ8Z60O88VMG"]
                    )
                )),
                URLRequestData.get(path: "/item/list", query: [
                    "limit": ["60"],
                    "offset": ["6"],
                    "orderBy": ["RESOLUTION"],
                    "keyword": ["ball"],
                    "ext": ["jpg"],
                    "tags": ["Design,Goal"],
                    "folders": ["KAY6NTU6UYI5Q,KBJ8Z60O88VMG"]
                ])
            ),
            (
                EagleRouteV1.item(.moveToTrash(
                    MoveToTrash(itemIds: ["KWLKGQW2HTHC7", "KWLOGLTX0FGHF"])
                )),
                URLRequestData.post(
                    path: "/item/moveToTrash",
                    body: {
                        let body =  MoveToTrash(itemIds: ["KWLKGQW2HTHC7", "KWLOGLTX0FGHF"])
                        return try? JSONEncoder().encode(body)
                    }()
                )
            ),
            (
                EagleRouteV1.item(.refresh(.palette(RefreshItem(id: "KBKE02W8V0YWD")))),
                URLRequestData.post(
                    path: "/item/refreshPalette",
                    body: {
                        let body =  RefreshItem(id: "KBKE02W8V0YWD")
                        return try? JSONEncoder().encode(body)
                    }()
                )
            ),
            (
                EagleRouteV1.item(.refresh(.thumbnail(RefreshItem(id: "KBKE02W8V0YWD")))),
                URLRequestData.post(
                    path: "/item/refreshThumbnail",
                    body: {
                        let body =  RefreshItem(id: "KBKE02W8V0YWD")
                        return try? JSONEncoder().encode(body)
                    }()
                )
            ),
            (
                EagleRouteV1.item(.update(
                    UpdateItem(
                        id: "KBN1X9NHDZ99F",
                        tags: ["Design1", "Design2"],
                        annotation: "Awesome",
                        url: "https://dribbble.com",
                        star: 4
                    )
                )),
                URLRequestData.post(
                    path: "/item/update",
                    body: {
                        let body = UpdateItem(
                        id: "KBN1X9NHDZ99F",
                        tags: ["Design1", "Design2"],
                        annotation: "Awesome",
                        url: "https://dribbble.com",
                        star: 4
                    )
                        return try? JSONEncoder().encode(body)
                    }()
                )
            ),
            (EagleRouteV1.library(.info), URLRequestData.get(path: "/library/info")),
            (EagleRouteV1.library(.history), URLRequestData.get(path: "/library/history")),
            (
                EagleRouteV1.library(.switch("/Users/augus/Pictures/Design.library")),
                URLRequestData.post(
                    path: "/library/switch",
                    body: {
                        try? JSONEncoder().encode("/Users/augus/Pictures/Design.library")
                    }()
                )
            ),
            (
                EagleRouteV1.library(.icon("/Users/augus/Pictures/Design.library")),
                URLRequestData.get(
                    path: "/library/icon", query: [
                        "libraryPath": ["/Users/augus/Pictures/Design.library"]
                    ]
                )
            )
        ])
        func router(_ route: EagleRouteV1, expected: URLRequestData) throws {
            let output = try EagleRouteV1.router.print(route)
            expectNoDifference(output, expected)
        }
    }
}
