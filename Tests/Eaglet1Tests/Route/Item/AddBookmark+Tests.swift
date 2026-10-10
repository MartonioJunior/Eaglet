//
//  AddBookmark+Tests.swift
//  Eaglet
//
//  Created by Martônio Júnior on 09/10/2026.
//

import CustomDump
@testable import Eaglet1
import Foundation
import Testing

struct AddBookmarkTests {
    @Test("Decodes a json into a valid request", arguments: [
        (
            """
            {
                "url": "https://www.pixiv.net/artworks/83585181",
                "name": "Cool Artwork",
                "tags": ["FGO", "Artworks"],
                "base64": "some-image-data",
                "modificationTime": 17484738574,
                "folderId": "KBKE02W8V0YWD"
            }
            """,
            AddBookmark(
                url: "https://www.pixiv.net/artworks/83585181",
                name: "Cool Artwork",
                base64: "some-image-data",
                tags: ["FGO", "Artworks"],
                modificationTime: 17484738574,
                folderID: "KBKE02W8V0YWD"
            )
        ),
        (
            """
            {
                "url": "https://www.pixiv.net/artworks/83585181",
                "name": "Cool Artwork",
                "tags": ["FGO", "Artworks"],
                "modificationTime": 17484738574,
                "folderId": "KBKE02W8V0YWD"
            }
            """,
            AddBookmark(
                url: "https://www.pixiv.net/artworks/83585181",
                name: "Cool Artwork",
                tags: ["FGO", "Artworks"],
                modificationTime: 17484738574,
                folderID: "KBKE02W8V0YWD"
            )
        ),
        (
            """
            {
                "url": "https://www.pixiv.net/artworks/83585181",
                "name": "Cool Artwork",
                "base64": "some-image-data",
                "modificationTime": 17484738574,
                "folderId": "KBKE02W8V0YWD"
            }
            """,
            AddBookmark(
                url: "https://www.pixiv.net/artworks/83585181",
                name: "Cool Artwork",
                base64: "some-image-data",
                modificationTime: 17484738574,
                folderID: "KBKE02W8V0YWD"
            )
        ),
        (
            """
            {
                "url": "https://www.pixiv.net/artworks/83585181",
                "name": "Cool Artwork",
                "tags": ["FGO", "Artworks"],
                "base64": "some-image-data",
                "folderId": "KBKE02W8V0YWD"
            }
            """,
            AddBookmark(
                url: "https://www.pixiv.net/artworks/83585181",
                name: "Cool Artwork",
                base64: "some-image-data",
                tags: ["FGO", "Artworks"],
                folderID: "KBKE02W8V0YWD"
            )
        ),
        (
            """
            {
                "url": "https://www.pixiv.net/artworks/83585181",
                "name": "Cool Artwork",
                "tags": ["FGO", "Artworks"],
                "base64": "some-image-data",
                "modificationTime": 17484738574,
            }
            """,
            AddBookmark(
                url: "https://www.pixiv.net/artworks/83585181",
                name: "Cool Artwork",
                base64: "some-image-data",
                tags: ["FGO", "Artworks"],
                modificationTime: 17484738574,
            )
        )
    ])
    func decodeInput(rawJson: String, expected: AddBookmark) throws {
        let result = try JSONDecoder().decode(
            AddBookmark.self,
            from: rawJson.data(using: .utf8) ?? Data()
        )

        expectNoDifference(result, expected)
    }
}
