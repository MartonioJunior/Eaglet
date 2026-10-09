//
//  RenameFolder+Tests.swift
//  Eaglet
//
//  Created by Martônio Júnior on 09/10/2026.
//

import CustomDump
@testable import Eaglet1
import Foundation
import Testing

struct RenameFolderTests {
    @Test("Decodes a json into a valid request", arguments: [
        (
            """
            {
                "folderId": "KBHOIWCUO6U9I",
                "newName": "New Folder Name"
            }
            """,
            RenameFolder(
                id: "KBHOIWCUO6U9I",
                newName: "New Folder Name"
            )
        )
    ])
    func decodeInput(rawJson: String, expected: RenameFolder) throws {
        let result = try JSONDecoder().decode(
            RenameFolder.self,
            from: rawJson.data(using: .utf8) ?? Data()
        )

        expectNoDifference(result, expected)
    }

    @Test("Decodes a json response into a valid object", arguments: [
        (
            """
            {
                "id": "KBJJSMMVF9WYL",
                "name": "New Folder Name",
                "images": [],
                "folders": [],
                "modificationTime": 1592409993367,
                "imagesMappings": {},
                "tags": [],
                "children": [],
                "isExpand": true,
                "size": 30,
                "vstype": "folder",
                "styles": {
                    "depth": 0,
                    "first": false,
                    "last": false
                },
                "isVisible": true,
                "$$hashKey": "object:765",
                "newFolderName": "The Folder Name",
                "editable": false,
                "pinyin": "New Folder Name"
            }
            """,
            RenameFolder.Output(
                id: "KBJJSMMVF9WYL",
                name: "New Folder Name",
                images: [],
                folders: [],
                modificationTime: 1592409993367,
                imagesMappings: [:],
                tags: [],
                children: [],
                isExpand: true,
                size: 30,
                vstype: "folder",
                styles: .init(depth: 0, first: false, last: false),
                isVisible: true,
                hashKey: "object:765",
                newFolderName: "The Folder Name",
                editable: false,
                pinyin: "New Folder Name"
            )
        )
    ])
    func decodeOutput(rawJson: String, expected: RenameFolder.Output) throws {
        let result = try JSONDecoder().decode(
            RenameFolder.Output.self,
            from: rawJson.data(using: .utf8) ?? Data()
        )

        expectNoDifference(result, expected)
    }
}
