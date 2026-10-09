//
//  UpdateFolder+Tests.swift
//  Eaglet
//
//  Created by Martônio Júnior on 09/10/2026.
//

import CustomDump
@testable import Eaglet1
import Foundation
import Testing

struct UpdateFolderTests {
    @Test("Decodes a json into a valid request", arguments: [
        (
            """
            {
                "folderId": "KMUFMKTBHINM4",
                "newName": "New Name",
                "newDescription": "New Description",
                "newColor": "red"
            }
            """,
            UpdateFolder(
                id: "KMUFMKTBHINM4",
                newName: "New Name",
                newDescription: "New Description",
                newColor: "red"
            )
        ),
        (
            """
            {
                "folderId": "KMUFMKTBHINM4",
                "newDescription": "New Description",
                "newColor": "red"
            }
            """,
            UpdateFolder(
                id: "KMUFMKTBHINM4",
                newName: nil,
                newDescription: "New Description",
                newColor: "red"
            )
        ),
        (
            """
            {
                "folderId": "KMUFMKTBHINM4",
                "newName": "New Name",
                "newColor": "red"
            }
            """,
            UpdateFolder(
                id: "KMUFMKTBHINM4",
                newName: "New Name",
                newDescription: nil,
                newColor: "red"
            )
        ),
        (
            """
            {
                "folderId": "KMUFMKTBHINM4",
                "newName": "New Name",
                "newDescription": "New Description",
            }
            """,
            UpdateFolder(
                id: "KMUFMKTBHINM4",
                newName: "New Name",
                newDescription: "New Description",
                newColor: nil
            )
        )
    ])
    func decodeInput(rawJson: String, expected: UpdateFolder) throws {
        let result = try JSONDecoder().decode(
            UpdateFolder.self,
            from: rawJson.data(using: .utf8) ?? Data()
        )

        expectNoDifference(result, expected)
    }

    @Test("Decodes a json response into a valid object", arguments: [
        (
            """
            {
                "id": "KMUFMKTBHINM4",
                "name": "New Name",
                "description": "New Description",
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
                "editable": false,
            }
            """,
            UpdateFolder.Output(
                id: "KMUFMKTBHINM4",
                name: "New Name",
                description: "New Description",
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
                editable: false
            )
        )
    ])
    func decodeOutput(rawJson: String, expected: UpdateFolder.Output) throws {
        let result = try JSONDecoder().decode(
            UpdateFolder.Output.self,
            from: rawJson.data(using: .utf8) ?? Data()
        )

        expectNoDifference(result, expected)
    }
}
