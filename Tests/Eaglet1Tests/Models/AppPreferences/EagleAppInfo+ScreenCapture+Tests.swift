//
//  EagleAppInfo+ScreenCapture+Tests.swift
//  Eaglet
//
//  Created by Martônio Júnior on 08/10/2026.
//

@testable import Eaglet1
import Foundation
import Testing

struct EagleAppInfoScreenCaptureTests {
    @Test("Decodes a json into a valid object", arguments: [
        (
            """
            {
                "autoTagging": {
                    "enable": "true"
                },
                "autoWriteClipboard": "false",
                "useRetina": "true",
                "shortcutsEnable": "true",
                "format": "png",
                "quality": "90"
            }
            """,
            EagleAppInfo.Preferences.ScreenCapture(
                autoTagging: .init(enable: true),
                autoWriteClipboard: false,
                useRetina: true,
                shortcutsEnable: true,
                format: "png",
                quality: 90
            )
        )
    ])
    func decode(rawJson: String, expected: EagleAppInfo.Preferences.ScreenCapture) {
        let result = try? JSONDecoder().decode(
            EagleAppInfo.Preferences.ScreenCapture.self,
            from: rawJson.data(using: .utf8) ?? Data()
        )

        #expect(result == expected)
    }
}
