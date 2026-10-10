//
//  UpdateItem+Tests.swift
//  Eaglet
//
//  Created by Martônio Júnior on 09/10/2026.
//

import CustomDump
@testable import Eaglet1
import Foundation
import Testing

struct UpdateItemTests {
    @Test("Decodes a json into a valid request", arguments: [
        (
            """
            {
                "id": "KBN1X9NHDZ99F",
                "tags": ["Design1", "Design2"],
                "annotation": "Awesome",
                "url": "https://dribbble.com",
                "star": 4
            }
            """,
            UpdateItem(
                id: "KBN1X9NHDZ99F",
                tags: ["Design1", "Design2"],
                annotation: "Awesome",
                url: "https://dribbble.com",
                star: 4
            )
        ),
        (
            """
            {
                "id": "KBN1X9NHDZ99F",
                "annotation": "Awesome",
                "url": "https://dribbble.com",
                "star": 4
            }
            """,
            UpdateItem(
                id: "KBN1X9NHDZ99F",
                annotation: "Awesome",
                url: "https://dribbble.com",
                star: 4
            )
        ),
        (
            """
            {
                "id": "KBN1X9NHDZ99F",
                "tags": ["Design1", "Design2"],
                "url": "https://dribbble.com",
                "star": 4
            }
            """,
            UpdateItem(
                id: "KBN1X9NHDZ99F",
                tags: ["Design1", "Design2"],
                url: "https://dribbble.com",
                star: 4
            )
        ),
        (
            """
            {
                "id": "KBN1X9NHDZ99F",
                "tags": ["Design1", "Design2"],
                "annotation": "Awesome",
                "star": 4
            }
            """,
            UpdateItem(
                id: "KBN1X9NHDZ99F",
                tags: ["Design1", "Design2"],
                annotation: "Awesome",
                star: 4
            )
        ),
        (
            """
            {
                "id": "KBN1X9NHDZ99F",
                "tags": ["Design1", "Design2"],
                "annotation": "Awesome",
                "url": "https://dribbble.com",
            }
            """,
            UpdateItem(
                id: "KBN1X9NHDZ99F",
                tags: ["Design1", "Design2"],
                annotation: "Awesome",
                url: "https://dribbble.com",
            )
        )
    ])
    func decodeInput(rawJson: String, expected: UpdateItem) throws {
        let result = try JSONDecoder().decode(
            UpdateItem.self,
            from: rawJson.data(using: .utf8) ?? Data()
        )

        expectNoDifference(result, expected)
    }

    @Test("Decodes a json response into a valid object", arguments: [
        (
            """
            {
                "id": "KBN1X9NHDZ99F",
                "name": "Top Character Design Trends for 2019 Bold Impressive",
                "size": 18447,
                "ext": "jpg",
                "tags": [
                    "Design1",
                    "Design2"
                ],
                "folders": [
                    "KBJJSMMVF9WYL"
                ],
                "isDeleted": false,
                "url": "https://dribbble.com",
                "annotation": "Awesome",
                "modificationTime": 1592621841437,
                "width": 450,
                "height": 545,
                "noThumbnail": true,
                "lastModified": 1592625558780,
                "palettes": [
                    {
                        "color": [
                            251,
                            244,
                            221
                        ],
                        "ratio": 80,
                        "$$hashKey": "object:678"
                    },
                    {
                        "color": [
                            10,
                            185,
                            202
                        ],
                        "ratio": 7,
                        "$$hashKey": "object:679"
                    },
                    {
                        "color": [
                            26,
                            37,
                            64
                        ],
                        "ratio": 6,
                        "$$hashKey": "object:680"
                    },
                    {
                        "color": [
                            217,
                            83,
                            11
                        ],
                        "ratio": 4.42,
                        "$$hashKey": "object:681"
                    },
                    {
                        "color": [
                            242,
                            200,
                            172
                        ],
                        "ratio": 0.51,
                        "$$hashKey": "object:682"
                    },
                    {
                        "color": [
                            214,
                            170,
                            135
                        ],
                        "ratio": 0.44,
                        "$$hashKey": "object:683"
                    },
                    {
                        "color": [
                            154,
                            208,
                            220
                        ],
                        "ratio": 0.31,
                        "$$hashKey": "object:684"
                    }
                ],
                "star": 4
            }
            """,
            UpdateItem.Output(
                id: "KBN1X9NHDZ99F",
                name: "Top Character Design Trends for 2019 Bold Impressive",
                size: 18447,
                ext: "jpg",
                tags: ["Design1", "Design2"],
                folders: ["KBJJSMMVF9WYL"],
                isDeleted: false,
                url: "https://dribbble.com",
                annotation: "Awesome",
                modificationTime: 1592621841437,
                width: 450,
                height: 545,
                noThumbnail: true,
                lastModified: 1592625558780,
                palettes: [
                    EagleItem.PaletteColor(color: [251, 244, 221], ratio: 80, hashKey: "object:678"),
                    EagleItem.PaletteColor(color: [10, 185, 202], ratio: 7, hashKey: "object:679"),
                    EagleItem.PaletteColor(color: [26, 37, 64], ratio: 6, hashKey: "object:680"),
                    EagleItem.PaletteColor(color: [217, 83, 11], ratio: 4.42, hashKey: "object:681"),
                    EagleItem.PaletteColor(color: [242, 200, 172], ratio: 0.51, hashKey: "object:682"),
                    EagleItem.PaletteColor(color: [214, 170, 135], ratio: 0.44, hashKey: "object:683"),
                    EagleItem.PaletteColor(color: [154, 208, 220], ratio: 0.31, hashKey: "object:684"),
                ],
                star: 4
            )
        )
    ])
    func decodeOutput(rawJson: String, expected: UpdateItem.Output) throws {
        let result = try JSONDecoder().decode(
            UpdateItem.Output.self,
            from: rawJson.data(using: .utf8) ?? Data()
        )

        expectNoDifference(result, expected)
    }
}
