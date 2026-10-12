//
//  EagleLibrary+Folder+Tests.swift
//  Eaglet
//
//  Created by Martônio Júnior on 11/10/2026.
//

import CustomDump
@testable import Eaglet1
import Foundation
import Testing

struct EagleLibraryFolderTests {
    @Test("Decodes a json into a valid object", arguments: [
        (
            """
            {
                    "id": "32455218-9e79-61ca-7e1d-034c0ed9f33b",
                    "name": "Poster Design",
                    "description": "",
                    "children": [
                        {
                            "id": "c89b30aa-b951-080c-0139-c2ea3f1aa549",
                            "name": "Poster Design 2",
                            "description": "",
                            "children": [],
                            "modificationTime": 1487586529221,
                            "tags": [],
                            "iconColor": "orange",
                            "password": "",
                            "passwordTips": "",
                            "coverId": "850b5be2-73be-5ab5-d96b-d16d1c4baef4",
                            "orderBy": "MANUAL",
                            "sortIncrease": true
                        }
                    ],
                    "modificationTime": 1487586362385,
                    "tags": [],
                    "iconColor": "red",
                    "password": "",
                    "passwordTips": "",
                    "coverId": "a387c5d6-5c27-4f1e-96d1-af7ae0256887",
                    "orderBy": "MANUAL",
                    "sortIncrease": true
                }
            """,
            EagleLibrary.Folder(
                    id: "32455218-9e79-61ca-7e1d-034c0ed9f33b",
                    name: "Poster Design",
                    description: "",
                    children: [
                        EagleLibrary.Folder(
                            id: "c89b30aa-b951-080c-0139-c2ea3f1aa549",
                            name: "Poster Design 2",
                            description: "",
                            children: [],
                            modificationTime: 1487586529221,
                            tags: [],
                            iconColor: "orange",
                            password: "",
                            passwordTips: "",
                            coverId: "850b5be2-73be-5ab5-d96b-d16d1c4baef4",
                            orderBy: "MANUAL",
                            sortIncrease: true
                        )
                    ],
                    modificationTime: 1487586362385,
                    tags: [],
                    iconColor: "red",
                    password: "",
                    passwordTips: "",
                    coverId: "a387c5d6-5c27-4f1e-96d1-af7ae0256887",
                    orderBy: "MANUAL",
                    sortIncrease: true
                )
        )
    ])
    func decode(rawJson: String, expected: EagleLibrary.Folder) throws {
        let result = try JSONDecoder().decode(
            EagleLibrary.Folder.self,
            from: rawJson.data(using: .utf8) ?? Data()
        )

        expectNoDifference(result, expected)
    }
}
