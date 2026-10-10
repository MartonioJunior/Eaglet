//
//  AddManyItems+Tests.swift
//  Eaglet
//
//  Created by Martônio Júnior on 09/10/2026.
//

import CustomDump
@testable import Eaglet1
import Foundation
import Testing

struct AddManyItemsTests {
    @Test("Decodes a json into a valid request", arguments: [
        (
            """
            {
                "items": [
                    {
                        "url": "https://cdn.dribbble.com/users/674925/screenshots/12020761/media/6420a7ec85751c11e5254282d6124950.png",
                        "name": "Work",
                        "website": "https://dribbble.com/shots/12020761-Work",
                        "tags": ["Illustration", "Design"],
                        "modificationTime": 1591325171767,
                        "headers": {
                            "referer": "dribbble.com"
                        }
                    },
                    {
                        "url": "https://cdn.dribbble.com/users/674925/screenshots/12061400/media/71da9ba40c47f09d8cd6953d661e61fd.png",
                        "name": "Work2",
                        "website": "https://dribbble.com/shots/12061400-work2",
                        "tags": ["Illustration", "Design"],
                        "modificationTime": 1591325171766,
                        "headers": {
                            "referer": "dribbble.com"
                        }
                    }
                ],
                "folderId": "KAY6NTU6UYI5Qa"
            }
            """,
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
        ),
        (
            """
            {
                "items": [
                    {
                        "path": "C://Users/User/Downloads/test.jpg",
                        "name": "アルトリア･キャスター",
                        "website": "https://www.pixiv.net/artworks/83585181",
                        "tags": ["FGO", "アルトリア・キャスター"],
                        "annotation": "久坂んむり"
                    },
                    {
                        "path": "C://Users/User/Downloads/test2.jpg",
                        "name": "アルトリア･キャスター",
                        "website": "https://www.pixiv.net/artworks/83585181",
                        "tags": ["FGO", "アルトリア・キャスター"],
                        "annotation": "久坂んむり"
                    }
                ],
                "folderId": "KEHB8I2C9F23H"
            }
            """,
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
                folderID: "KEHB8I2C9F23H"
            )
        ),
        (
            """
            {
                "items": [
                    {
                        "url": "https://cdn.dribbble.com/users/674925/screenshots/12020761/media/6420a7ec85751c11e5254282d6124950.png",
                        "name": "Work",
                        "website": "https://dribbble.com/shots/12020761-Work",
                        "tags": ["Illustration", "Design"],
                        "modificationTime": 1591325171767,
                        "headers": {
                            "referer": "dribbble.com"
                        }
                    },
                    {
                        "path": "C://Users/User/Downloads/test2.jpg",
                        "name": "アルトリア･キャスター",
                        "website": "https://www.pixiv.net/artworks/83585181",
                        "tags": ["FGO", "アルトリア・キャスター"],
                        "annotation": "久坂んむり"
                    }
                ],
                "folderId": "KAY6NTU6UYI5Qa"
            }
            """,
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
        )
    ])
    func decodeInput(rawJson: String, expected: AddManyItems) throws {
        let result = try JSONDecoder().decode(
            AddManyItems.self,
            from: rawJson.data(using: .utf8) ?? Data()
        )

        expectNoDifference(result, expected)
    }
}
