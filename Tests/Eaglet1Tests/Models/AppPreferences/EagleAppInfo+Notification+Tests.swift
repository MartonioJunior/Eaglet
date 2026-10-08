//
//  EagleAppInfo+Notification+Tests.swift
//  Eaglet
//
//  Created by Martônio Júnior on 08/10/2026.
//

@testable import Eaglet1
import Foundation
import Testing

struct EagleAppInfoNotificationTests {
    @Test("Decodes a json into a valid object", arguments: [
        (
            """
            {
                "soundEffect": {
                    "enable": "true",
                    "when": {
                        "deleteImage": "true",
                        "deleteFolder": "true",
                        "screencapture": "true",
                        "extension": "true"
                    }
                },
                "notification": {
                    "enable": "true",
                    "when": {
                        "screencapture": "true",
                        "extension": "true",
                        "repeatImage": "true",
                        "autoImport": "true"
                    }
                }
            }
            """,
            EagleAppInfo.Preferences.Notification(
                soundEffect: .init(enable: true, when: [
                    "deleteImage": true,
                    "deleteFolder": true,
                    "screencapture": true,
                    "extension": true
                ]),
                notification: .init(enable: true, when: [
                    "screencapture": true,
                    "extension": true,
                    "repeatImage": true,
                    "autoImport": true
                ])
            )
        )
    ])
    func decode(rawJson: String, expected: EagleAppInfo.Preferences.Notification) {
        let result = try? JSONDecoder().decode(
            EagleAppInfo.Preferences.Notification.self,
            from: rawJson.data(using: .utf8) ?? Data()
        )

        #expect(result == expected)
    }
}
