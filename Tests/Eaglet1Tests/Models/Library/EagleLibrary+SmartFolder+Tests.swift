//
//  EagleLibrary+SmartFolder+Tests.swift
//  Eaglet
//
//  Created by Martônio Júnior on 12/10/2026.
//

import CustomDump
@testable import Eaglet1
import Foundation
import Testing

struct EagleLibrarySmartFolderTests {
    @Test("Decodes a json into a valid object", arguments: [
        (
            """
            {
                "id": "7de0bdb8-3124-add7-4a1f-b51f126aa738",
                "name": "Red Posters",
                "description": "",
                "modificationTime": 1564766432167,
                "conditions": [
                    {
                        "$$hashKey": "object:7456",
                        "match": "AND",
                        "rules": [
                            {
                                "$$hashKey": "object:7462",
                                "method": "intersection",
                                "property": "tags",
                                "value": [
                                    "Poster"
                                ]
                            },
                            {
                                "$$hashKey": "object:7463",
                                "method": "similar",
                                "property": "color",
                                "value": "#ff2600"
                            }
                        ]
                    }
                ]
            }
            """,
            EagleLibrary.SmartFolder(
                id: "7de0bdb8-3124-add7-4a1f-b51f126aa738",
                name: "Red Posters",
                description: "",
                modificationTime: 1564766432167,
                conditions: [
                    EagleLibrary.SmartFolder.Condition(
                        hashKey: "object:7456",
                        match: "AND",
                        rules: [
                            EagleLibrary.SmartFolder.Condition.Rule(
                                hashKey: "object:7462",
                                method: "intersection",
                                property: "tags",
                                value: ["Poster"]
                            ),
                            EagleLibrary.SmartFolder.Condition.Rule(
                                hashKey: "object:7463",
                                method: "similar",
                                property: "color",
                                value: "#ff2600"
                            )
                        ]
                    )
                ],
            )
        )
    ])
    func decode(rawJson: String, expected: EagleLibrary.SmartFolder) throws {
        let result = try JSONDecoder().decode(
            EagleLibrary.SmartFolder.self,
            from: rawJson.data(using: .utf8) ?? Data()
        )

        expectNoDifference(result, expected)
    }
}
