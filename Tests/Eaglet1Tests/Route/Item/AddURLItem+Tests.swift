//
//  AddURLItem+Tests.swift
//  Eaglet
//
//  Created by Martônio Júnior on 09/10/2026.
//

import CustomDump
@testable import Eaglet1
import Foundation
import Testing

struct AddURLItemTests {
    @Test("Decodes a json into a valid request", arguments: [
        (
            """
            {
                "url": "https://cdn.dribbble.com/users/674925/screenshots/12020761/media/6420a7ec85751c11e5254282d6124950.png",
                "name": "Work",
                "website": "https://dribbble.com/shots/12020761-Work",
                "tags": ["Illustration", "Design"],
                "star": 4,
                "annotation": "An annotation",
                "modificationTime": 1591325171766,
                "folderId": "KBJJSMMVF9WYL",
                "headers": {
                    "referer": "dribbble.com"
                }
            }
            """,
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
        ),
        (
            """
            {
                "url": "https://cdn.dribbble.com/users/674925/screenshots/12020761/media/6420a7ec85751c11e5254282d6124950.png",
                "name": "Work",
                "tags": ["Illustration", "Design"],
                "star": 4,
                "annotation": "An annotation",
                "modificationTime": 1591325171766,
                "folderId": "KBJJSMMVF9WYL",
                "headers": {
                    "referer": "dribbble.com"
                }
            }
            """,
            AddURLItem(
                url: "https://cdn.dribbble.com/users/674925/screenshots/12020761/media/6420a7ec85751c11e5254282d6124950.png",
                name: "Work",
                tags: ["Illustration", "Design"],
                star: 4,
                annotation: "An annotation",
                modificationTime: 1591325171766,
                folderID: "KBJJSMMVF9WYL",
                headers: ["referer": "dribbble.com"]
            )
        ),
        (
            """
            {
                "url": "https://cdn.dribbble.com/users/674925/screenshots/12020761/media/6420a7ec85751c11e5254282d6124950.png",
                "name": "Work",
                "website": "https://dribbble.com/shots/12020761-Work",
                "star": 4,
                "annotation": "An annotation",
                "modificationTime": 1591325171766,
                "folderId": "KBJJSMMVF9WYL",
                "headers": {
                    "referer": "dribbble.com"
                }
            }
            """,
            AddURLItem(
                url: "https://cdn.dribbble.com/users/674925/screenshots/12020761/media/6420a7ec85751c11e5254282d6124950.png",
                name: "Work",
                website: "https://dribbble.com/shots/12020761-Work",
                star: 4,
                annotation: "An annotation",
                modificationTime: 1591325171766,
                folderID: "KBJJSMMVF9WYL",
                headers: ["referer": "dribbble.com"]
            )
        ),
        (
            """
            {
                "url": "https://cdn.dribbble.com/users/674925/screenshots/12020761/media/6420a7ec85751c11e5254282d6124950.png",
                "name": "Work",
                "website": "https://dribbble.com/shots/12020761-Work",
                "tags": ["Illustration", "Design"],
                "annotation": "An annotation",
                "modificationTime": 1591325171766,
                "folderId": "KBJJSMMVF9WYL",
                "headers": {
                    "referer": "dribbble.com"
                }
            }
            """,
            AddURLItem(
                url: "https://cdn.dribbble.com/users/674925/screenshots/12020761/media/6420a7ec85751c11e5254282d6124950.png",
                name: "Work",
                website: "https://dribbble.com/shots/12020761-Work",
                tags: ["Illustration", "Design"],
                annotation: "An annotation",
                modificationTime: 1591325171766,
                folderID: "KBJJSMMVF9WYL",
                headers: ["referer": "dribbble.com"]
            )
        ),
        (
            """
            {
                "url": "https://cdn.dribbble.com/users/674925/screenshots/12020761/media/6420a7ec85751c11e5254282d6124950.png",
                "name": "Work",
                "website": "https://dribbble.com/shots/12020761-Work",
                "tags": ["Illustration", "Design"],
                "star": 4,
                "modificationTime": 1591325171766,
                "folderId": "KBJJSMMVF9WYL",
                "headers": {
                    "referer": "dribbble.com"
                }
            }
            """,
            AddURLItem(
                url: "https://cdn.dribbble.com/users/674925/screenshots/12020761/media/6420a7ec85751c11e5254282d6124950.png",
                name: "Work",
                website: "https://dribbble.com/shots/12020761-Work",
                tags: ["Illustration", "Design"],
                star: 4,
                modificationTime: 1591325171766,
                folderID: "KBJJSMMVF9WYL",
                headers: ["referer": "dribbble.com"]
            )
        ),
        (
            """
            {
                "url": "https://cdn.dribbble.com/users/674925/screenshots/12020761/media/6420a7ec85751c11e5254282d6124950.png",
                "name": "Work",
                "website": "https://dribbble.com/shots/12020761-Work",
                "tags": ["Illustration", "Design"],
                "star": 4,
                "annotation": "An annotation",
                "folderId": "KBJJSMMVF9WYL",
                "headers": {
                    "referer": "dribbble.com"
                }
            }
            """,
            AddURLItem(
                url: "https://cdn.dribbble.com/users/674925/screenshots/12020761/media/6420a7ec85751c11e5254282d6124950.png",
                name: "Work",
                website: "https://dribbble.com/shots/12020761-Work",
                tags: ["Illustration", "Design"],
                star: 4,
                annotation: "An annotation",
                folderID: "KBJJSMMVF9WYL",
                headers: ["referer": "dribbble.com"]
            )
        ),
        (
            """
            {
                "url": "https://cdn.dribbble.com/users/674925/screenshots/12020761/media/6420a7ec85751c11e5254282d6124950.png",
                "name": "Work",
                "website": "https://dribbble.com/shots/12020761-Work",
                "tags": ["Illustration", "Design"],
                "star": 4,
                "annotation": "An annotation",
                "modificationTime": 1591325171766,
                "headers": {
                    "referer": "dribbble.com"
                }
            }
            """,
            AddURLItem(
                url: "https://cdn.dribbble.com/users/674925/screenshots/12020761/media/6420a7ec85751c11e5254282d6124950.png",
                name: "Work",
                website: "https://dribbble.com/shots/12020761-Work",
                tags: ["Illustration", "Design"],
                star: 4,
                annotation: "An annotation",
                modificationTime: 1591325171766,
                headers: ["referer": "dribbble.com"]
            )
        ),
        (
            """
            {
                "url": "https://cdn.dribbble.com/users/674925/screenshots/12020761/media/6420a7ec85751c11e5254282d6124950.png",
                "name": "Work",
                "website": "https://dribbble.com/shots/12020761-Work",
                "tags": ["Illustration", "Design"],
                "star": 4,
                "annotation": "An annotation",
                "modificationTime": 1591325171766,
                "folderId": "KBJJSMMVF9WYL",
            }
            """,
            AddURLItem(
                url: "https://cdn.dribbble.com/users/674925/screenshots/12020761/media/6420a7ec85751c11e5254282d6124950.png",
                name: "Work",
                website: "https://dribbble.com/shots/12020761-Work",
                tags: ["Illustration", "Design"],
                star: 4,
                annotation: "An annotation",
                modificationTime: 1591325171766,
                folderID: "KBJJSMMVF9WYL",
            )
        )
    ])
    func decodeInput(rawJson: String, expected: AddURLItem) throws {
        let result = try JSONDecoder().decode(
            AddURLItem.self,
            from: rawJson.data(using: .utf8) ?? Data()
        )

        expectNoDifference(result, expected)
    }
}
