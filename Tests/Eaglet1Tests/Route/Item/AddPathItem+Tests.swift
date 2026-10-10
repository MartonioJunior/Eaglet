//
//  AddPathItem+Tests.swift
//  Eaglet
//
//  Created by Martônio Júnior on 09/10/2026.
//

import CustomDump
@testable import Eaglet1
import Foundation
import Testing

struct AddPathItemTests {
    @Test("Decodes a json into a valid request", arguments: [
        (
            """
            {
                "path": "C://Users/User/Downloads/test.jpg",
                "name": "アルトリア･キャスター",
                "website": "https://www.pixiv.net/artworks/83585181",
                "tags": ["FGO", "アルトリア・キャスター"],
                "annotation": "久坂んむり",
                "folderId": "KEHB8I2C9F23H"
            }
            """,
            AddPathItem(
                path: "C://Users/User/Downloads/test.jpg",
                name: "アルトリア･キャスター",
                website: "https://www.pixiv.net/artworks/83585181",
                annotation: "久坂んむり",
                tags: ["FGO", "アルトリア・キャスター"],
                folderID: "KEHB8I2C9F23H"
            )
        ),
        (
            """
            {
                "path": "C://Users/User/Downloads/test.jpg",
                "name": "アルトリア･キャスター",
                "tags": ["FGO", "アルトリア・キャスター"],
                "annotation": "久坂んむり",
                "folderId": "KEHB8I2C9F23H"
            }
            """,
            AddPathItem(
                path: "C://Users/User/Downloads/test.jpg",
                name: "アルトリア･キャスター",
                annotation: "久坂んむり",
                tags: ["FGO", "アルトリア・キャスター"],
                folderID: "KEHB8I2C9F23H"
            )
        ),
        (
            """
            {
                "path": "C://Users/User/Downloads/test.jpg",
                "name": "アルトリア･キャスター",
                "website": "https://www.pixiv.net/artworks/83585181",
                "tags": ["FGO", "アルトリア・キャスター"],
                "folderId": "KEHB8I2C9F23H"
            }
            """,
            AddPathItem(
                path: "C://Users/User/Downloads/test.jpg",
                name: "アルトリア･キャスター",
                website: "https://www.pixiv.net/artworks/83585181",
                tags: ["FGO", "アルトリア・キャスター"],
                folderID: "KEHB8I2C9F23H"
            )
        ),
        (
            """
            {
                "path": "C://Users/User/Downloads/test.jpg",
                "name": "アルトリア･キャスター",
                "website": "https://www.pixiv.net/artworks/83585181",
                "annotation": "久坂んむり",
                "folderId": "KEHB8I2C9F23H"
            }
            """,
            AddPathItem(
                path: "C://Users/User/Downloads/test.jpg",
                name: "アルトリア･キャスター",
                website: "https://www.pixiv.net/artworks/83585181",
                annotation: "久坂んむり",
                folderID: "KEHB8I2C9F23H"
            )
        ),
        (
            """
            {
                "path": "C://Users/User/Downloads/test.jpg",
                "name": "アルトリア･キャスター",
                "website": "https://www.pixiv.net/artworks/83585181",
                "tags": ["FGO", "アルトリア・キャスター"],
                "annotation": "久坂んむり",
            }
            """,
            AddPathItem(
                path: "C://Users/User/Downloads/test.jpg",
                name: "アルトリア･キャスター",
                website: "https://www.pixiv.net/artworks/83585181",
                annotation: "久坂んむり",
                tags: ["FGO", "アルトリア・キャスター"],
            )
        )
    ])
    func decodeInput(rawJson: String, expected: AddPathItem) throws {
        let result = try JSONDecoder().decode(
            AddPathItem.self,
            from: rawJson.data(using: .utf8) ?? Data()
        )

        expectNoDifference(result, expected)
    }
}
