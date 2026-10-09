//
//  CreateFolder+Tests.swift
//  Eaglet
//
//  Created by Martônio Júnior on 08/10/2026.
//

import CustomDump
@testable import Eaglet1
import Foundation
import Testing

struct CreateFolderTests {
    @Test("Decodes a json into a valid request", arguments: [
        (
            """
            {
                "folderName": "The Folder Name"
            }
            """,
            CreateFolder(
                folderName: "The Folder Name"
            )
        ),
        (
            """
            {
                "folderName": "The Folder Name",
                "parent": "KBJJSMMVF9WYL"
            }
            """,
            CreateFolder(
                folderName: "The Folder Name",
                parent: "KBJJSMMVF9WYL"
            )
        )
    ])
    func decodeInput(rawJson: String, expected: CreateFolder) throws {
        let result = try JSONDecoder().decode(
            CreateFolder.self,
            from: rawJson.data(using: .utf8) ?? Data()
        )

        expectNoDifference(result, expected)
    }

    @Test("Decodes a json response into a valid object", arguments: [
        (
            """
            {
                "id": "KBJJSMMVF9WYL",
                "name": "The Folder Name",
                "images": [],
                "folders": [],
                "modificationTime": 1592409993367,
                "imagesMappings": {},
                "tags": [],
                "children": [],
                "isExpand": true
            }
            """,
            CreateFolder.Output(
                id: "KBJJSMMVF9WYL",
                name: "The Folder Name",
                images: [],
                folders: [],
                modificationTime: 1592409993367,
                imagesMappings: [:],
                tags: [],
                children: [],
                isExpand: true
            )
        )
    ])
    func decodeOutput(rawJson: String, expected: CreateFolder.Output) throws {
        let result = try JSONDecoder().decode(
            CreateFolder.Output.self,
            from: rawJson.data(using: .utf8) ?? Data()
        )

        expectNoDifference(result, expected)
    }
}
