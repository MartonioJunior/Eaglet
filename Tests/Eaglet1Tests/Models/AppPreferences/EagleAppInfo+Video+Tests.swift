//
//  EagleAppInfo+Video+Tests.swift
//  Eaglet
//
//  Created by Martônio Júnior on 08/10/2026.
//

import CustomDump
@testable import Eaglet1
import Foundation
import Testing

struct EagleAppInfoVideoTests {
    @Test("Decodes a json into a valid object", arguments: [
        (
            """
            {
                "hoverPlay": "true",
                "zoomFill": "false",
                "autoPlay": "true",
                "rememberPosition": "true",
                "loopShortVideo": "true"
            }
            """,
            EagleAppInfo.Preferences.Video(
                hoverPlay: true,
                zoomFill: false,
                autoPlay: true,
                rememberPosition: true,
                loopShortVideo: true
            )
        )
    ])
    func decode(rawJson: String, expected: EagleAppInfo.Preferences.Video) throws {
        let result = try JSONDecoder().decode(
            EagleAppInfo.Preferences.Video.self,
            from: rawJson.data(using: .utf8) ?? Data()
        )

        expectNoDifference(result, expected)
    }
}
