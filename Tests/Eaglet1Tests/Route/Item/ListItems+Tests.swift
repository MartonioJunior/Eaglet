//
//  ListItems+Tests.swift
//  Eaglet
//
//  Created by Martônio Júnior on 09/10/2026.
//

import CustomDump
@testable import Eaglet1
import Foundation
import Testing

struct ListItemsTests {
    @Test("Decodes a json into a valid request", arguments: [
        (
            """
            {
                "limit": 30,
                "offset": 5,
                "orderBy": "FILESIZE",
                "keyword": "ball",
                "ext": "jpg",
                "tags": "Design,Goal",
                "folders": "KAY6NTU6UYI5Q,KBJ8Z60O88VMG"
            }
            """,
            ListItems(
                limit: 30,
                offset: 5,
                orderBy: .init(.ascending, .fileSize),
                keyword: "ball",
                extensionType: "jpg",
                tags: ["Design", "Goal"],
                folders: ["KAY6NTU6UYI5Q", "KBJ8Z60O88VMG"]
            )
        ),
        (
            """
            {
                "offset": 5,
                "orderBy": "CREATEDATE",
                "keyword": "ball",
                "ext": "jpg",
                "tags": "Design,Goal",
                "folders": "KAY6NTU6UYI5Q,KBJ8Z60O88VMG"
            }
            """,
            ListItems(
                limit: 200,
                offset: 5,
                orderBy: .init(.ascending, .creationDate),
                keyword: "ball",
                extensionType: "jpg",
                tags: ["Design", "Goal"],
                folders: ["KAY6NTU6UYI5Q", "KBJ8Z60O88VMG"]
            )
        ),
        (
            """
            {
                "limit": 30,
                "orderBy": "RESOLUTION",
                "keyword": "ball",
                "ext": "jpg",
                "tags": "Design,Goal",
                "folders": "KAY6NTU6UYI5Q,KBJ8Z60O88VMG"
            }
            """,
            ListItems(
                limit: 30,
                offset: 0,
                orderBy: .init(.ascending, .resolution),
                keyword: "ball",
                extensionType: "jpg",
                tags: ["Design", "Goal"],
                folders: ["KAY6NTU6UYI5Q", "KBJ8Z60O88VMG"]
            )
        ),
        (
            """
            {
                "limit": 30,
                "offset": 5,
                "orderBy": "-CREATEDATE",
                "ext": "jpg",
                "tags": "Design,Goal",
                "folders": "KAY6NTU6UYI5Q,KBJ8Z60O88VMG"
            }
            """,
            ListItems(
                limit: 30,
                offset: 5,
                orderBy: .init(.descending, .creationDate),
                extensionType: "jpg",
                tags: ["Design", "Goal"],
                folders: ["KAY6NTU6UYI5Q", "KBJ8Z60O88VMG"]
            )
        ),
        (
            """
            {
                "limit": 30,
                "offset": 5,
                "orderBy": "NAME",
                "keyword": "ball",
                "tags": "Design,Goal",
                "folders": "KAY6NTU6UYI5Q,KBJ8Z60O88VMG"
            }
            """,
            ListItems(
                limit: 30,
                offset: 5,
                orderBy: .init(.ascending, .name),
                keyword: "ball",
                tags: ["Design", "Goal"],
                folders: ["KAY6NTU6UYI5Q", "KBJ8Z60O88VMG"]
            )
        ),
        (
            """
            {
                "limit": 30,
                "offset": 5,
                "orderBy": "-RESOLUTION",
                "keyword": "ball",
                "ext": "jpg",
                "folders": "KAY6NTU6UYI5Q,KBJ8Z60O88VMG"
            }
            """,
            ListItems(
                limit: 30,
                offset: 5,
                orderBy: .init(.descending, .resolution),
                keyword: "ball",
                extensionType: "jpg",
                folders: ["KAY6NTU6UYI5Q", "KBJ8Z60O88VMG"]
            )
        ),
        (
            """
            {
                "limit": 30,
                "offset": 5,
                "orderBy": "-FILESIZE",
                "keyword": "ball",
                "ext": "jpg",
                "tags": "Design,Goal",
            }
            """,
            ListItems(
                limit: 30,
                offset: 5,
                orderBy: .init(.descending, .fileSize),
                keyword: "ball",
                extensionType: "jpg",
                tags: ["Design", "Goal"],
            )
        )
    ])
    func decodeInput(rawJson: String, expected: ListItems) throws {
        let result = try JSONDecoder().decode(
            ListItems.self,
            from: rawJson.data(using: .utf8) ?? Data()
        )

        expectNoDifference(result, expected)
    }
}
