//
//  EagleItem+Tests.swift
//  Eaglet
//
//  Created by Martônio Júnior on 09/10/2026.
//

import CustomDump
@testable import Eaglet1
import Foundation
import Testing

struct EagleItemTests {
    @Test("Decodes a json into a valid request", arguments: [
        (
            """
            {
                "id": "MUIPQZWJQQ0WQ",
                "name": "Hades in Concert - Ballads of the Underworld (Concert Video) - YouTube",
                "size": 72,
                "btime": 1790446721354,
                "mtime": 1790446721355,
                "ext": "url",
                "tags": [
                    "Complete Soundtrack",
                    "Resampled"
                ],
                "folders": [
                    "LW2AWVT13PF86"
                ],
                "isDeleted": false,
                "url": "https://www.youtube.com/watch?v=fvGSQFZWcwM",
                "annotation": "",
                "modificationTime": 1790446721347,
                "height": 360,
                "width": 480,
                "videoID": "fvGSQFZWcwM",
                "medium": "youtube",
                "duration": "5999",
                "lastModified": 1790446722027,
                "palettes": [
                    {
                        "color": [16, 12, 9],
                        "ratio": 50
                    },
                    {
                        "color": [71, 48, 38],
                        "ratio": 19
                    },
                    {
                        "color": [118, 82, 69],
                        "ratio": 12
                    },
                    {
                        "color": [181, 148, 138],
                        "ratio": 5
                    },
                    {
                        "color": [71, 64, 79],
                        "ratio": 4.32
                    },
                    {
                        "color": [112, 163, 155],
                        "ratio": 3.09
                    },
                    {
                        "color": [82, 95, 91],
                        "ratio": 2.82
                    },
                    {
                        "color": [113, 131, 138],
                        "ratio": 1.34
                    },
                    {
                        "color": [192, 216, 189],
                        "ratio": 1.27
                    },
                    {
                        "color": [165, 125, 61],
                        "ratio": 0.4
                    }
                ]
            }
            """,
            EagleItem(
                id: "MUIPQZWJQQ0WQ",
                name: "Hades in Concert - Ballads of the Underworld (Concert Video) - YouTube",
                size: 72,
                btime: 1790446721354,
                mtime: 1790446721355,
                ext: "url",
                tags: [
                    "Complete Soundtrack",
                    "Resampled"
                ],
                folders: ["LW2AWVT13PF86"],
                isDeleted: false,
                url: "https://www.youtube.com/watch?v=fvGSQFZWcwM",
                annotation: "",
                modificationTime: 1790446721347,
                width: 480,
                height: 360,
                videoID: "fvGSQFZWcwM",
                medium: "youtube",
                duration: .init(5999),
                lastModified: 1790446722027,
                palettes: [
                    EagleItem.PaletteColor(color: [16, 12, 9], ratio: 50),
                    EagleItem.PaletteColor(color: [71, 48, 38], ratio: 19),
                    EagleItem.PaletteColor(color: [118, 82, 69], ratio: 12),
                    EagleItem.PaletteColor(color: [181, 148, 138], ratio: 5),
                    EagleItem.PaletteColor(color: [71, 64, 79], ratio: 4.32),
                    EagleItem.PaletteColor(color: [112, 163, 155], ratio: 3.09),
                    EagleItem.PaletteColor(color: [82, 95, 91], ratio: 2.82),
                    EagleItem.PaletteColor(color: [113, 131, 138], ratio: 1.34),
                    EagleItem.PaletteColor(color: [192, 216, 189], ratio: 1.27),
                    EagleItem.PaletteColor(color: [165, 125, 61], ratio: 0.4)
                ]
            )
        )
    ])
    func decodeInput(rawJson: String, expected: EagleItem) throws {
        let result = try JSONDecoder().decode(
            EagleItem.self,
            from: rawJson.data(using: .utf8) ?? Data()
        )

        // expectNoDifference(result, expected)
        #expect(result == expected)
    }
}
