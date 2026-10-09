//
//  EagleFolder+Tests.swift
//  Eaglet
//
//  Created by Martônio Júnior on 08/10/2026.
//

import CustomDump
@testable import Eaglet1
import Foundation
import Testing

struct EagleFolderTests {
    @Test("Decodes a json into a valid object", arguments: [
        (
            EagleFolder.ListItem.mockJSON,
            EagleFolder.ListItem(
                id: "M9M017F78NJM6",
                name: "Glyphs",
                description: "A fun description.",
                children: [
                    EagleFolder.ListItem(
                        id: "MV01R03GRDIKG",
                        name: "No Outline",
                        description: "",
                        children: [],
                        modificationTime: 1791494801980,
                        tags: [],
                        extendTags: [],
                        icon: "grid",
                        iconColor: "orange",
                        pinyin: "No Outline",
                        password: "",
                        passwordTips: ""
                    )
                ],
                modificationTime: 1744932963283,
                tags: [],
                extendTags: [],
                icon: "like",
                iconColor: "red",
                pinyin: "Glyphs",
                password: "",
                passwordTips: ""
            )
        )
    ])
    func decodeListItem(rawJson: String, expected: EagleFolder.ListItem) throws {
        let result = try JSONDecoder().decode(
            EagleFolder.ListItem.self,
            from: rawJson.data(using: .utf8) ?? Data()
        )

        expectNoDifference(result, expected)
    }

    @Test("Decodes a json into a valid object", arguments: [
        (
            EagleFolder.RecentItem.mockJSON,
            EagleFolder.RecentItem(
                id: "MV01R03GRDIKG",
                name: "No Outline",
                images: [],
                folders: [],
                modificationTime: 1791494801980,
                editable: false,
                imagesMappings: [:],
                tags: [],
                children: [],
                isExpand: true,
                parent: "M9M017F78NJM6",
                icon: "grid",
                iconColor: "orange",
                size: 27,
                vstype: "folder",
                guidelines: ["red"],
                styles: .init(depth: 1, first: false, last: true),
                isVisible: true,
                index: 12,
                hashKey: "object:15752",
                newFolderName: "No Outline",
                imageCount: 1,
                depth: 1,
                descendantImageCount: 1,
                pinyin: "No Outline",
                extendTags: [],
                covers: ["cover-image"]
            )
        )
    ])
    func decodeRecent(rawJson: String, expected: EagleFolder.RecentItem) throws {
        let result = try JSONDecoder().decode(
            EagleFolder.RecentItem.self,
            from: rawJson.data(using: .utf8) ?? Data()
        )

        expectNoDifference(result, expected)
    }
}

// MARK: Mock (EX)
public extension EagleFolder.ListItem {
    static var mockJSON: String {
        """
        {
            "id": "M9M017F78NJM6",
            "name": "Glyphs",
            "description": "A fun description.",
            "children": [
                {
                    "id": "MV01R03GRDIKG",
                    "name": "No Outline",
                    "description": "",
                    "children": [],
                    "modificationTime": 1791494801980,
                    "tags": [],
                    "extendTags": [],
                    "icon": "grid",
                    "iconColor": "orange",
                    "pinyin": "No Outline",
                    "password": "",
                    "passwordTips": ""
                }
            ],
            "modificationTime": 1744932963283,
            "tags": [],
            "extendTags": [],
            "icon": "like",
            "iconColor": "red",
            "pinyin": "Glyphs",
            "password": "",
            "passwordTips": ""
        }
        """
    }
}

public extension EagleFolder.RecentItem {
    static var mockJSON: String {
        """
        {
            "id": "MV01R03GRDIKG",
            "name": "No Outline",
            "images": [],
            "folders": [],
            "modificationTime": 1791494801980,
            "editable": false,
            "imagesMappings": {},
            "tags": [],
            "children": [],
            "isExpand": true,
            "parent": "M9M017F78NJM6",
            "icon": "grid",
            "iconColor": "orange",
            "size": 27,
            "vstype": "folder",
            "guidelines": [
                "red"
            ],
            "styles": {
                "depth": 1,
                "first": false,
                "last": true
            },
            "isVisible": true,
            "index": 12,
            "$$hashKey": "object:15752",
            "newFolderName": "No Outline",
            "imageCount": 1,
            "depth": 1,
            "descendantImageCount": 1,
            "pinyin": "No Outline",
            "extendTags": [],
            "covers": [
                "cover-image"
            ]
        }
        """
    }
}
