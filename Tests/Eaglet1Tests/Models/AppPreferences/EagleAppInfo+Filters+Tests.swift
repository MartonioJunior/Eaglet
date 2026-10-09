//
//  EagleAppInfo+Filters+Tests.swift
//  Eaglet
//
//  Created by Martônio Júnior on 08/10/2026.
//

import CustomDump
@testable import Eaglet1
import Foundation
import Testing

struct EagleAppInfoFiltersTests {
    @Test("Decodes a json into a valid object", arguments: [
        (
            """
            {
                "color": "true",
                "tags": "true",
                "folders": "true",
                "shape": "true",
                "rating": "true",
                "type": "true",
                "date": "true",
                "mtime": "false",
                "resolution": "true",
                "fileSize": "true",
                "comments": "false",
                "annotation": "true",
                "url": "true",
                "camera": "false",
                "duration": "true",
                "bpm": "false",
                "fontActivated": "false"
            }
            """,
            EagleAppInfo.Preferences.Filters(
                color: true,
                tags: true,
                folders: true,
                shape: true,
                rating: true,
                type: true,
                date: true,
                mtime: false,
                resolution: true,
                fileSize: true,
                comments: false,
                annotation: true,
                url: true,
                camera: false,
                duration: true,
                bpm: false,
                fontActivated: false
            )
        )
    ])
    func decode(rawJson: String, expected: EagleAppInfo.Preferences.Filters) throws {
        let result = try JSONDecoder().decode(
            EagleAppInfo.Preferences.Filters.self,
            from: rawJson.data(using: .utf8) ?? Data()
        )

        expectNoDifference(result, expected)
    }
}
