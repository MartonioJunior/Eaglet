//
//  EagleAppInfo+GeneralPreferences+Tests.swift
//  Eaglet
//
//  Created by Martônio Júnior on 08/10/2026.
//

@testable import Eaglet1
import Foundation
import Testing

struct EagleAppInfoGeneralPreferencesTests {
    @Test("Decodes a json into a valid object", arguments: [
        (
            """
            {
                "zoom": "100",
                "language": "en",
                "showMenuItem": "true",
                "keepDockIcon": "true",
                "showSidebarBadge": "true",
                "autoSelect": "true",
                "showCollectModal": "false",
                "showCaptureCollectModal": "false",
                "IPTC": "false",
                "enableGPU": "true",
                "enableVibrancy": "true"
            }
            """,
            EagleAppInfo.Preferences.General(
                zoom: 100,
                language: "en",
                showMenuItem: true,
                showSidebarBadge: true,
                autoSelect: true,
                showCollectModal: false,
                showCaptureCollectModal: false,
                IPTC: false,
                enableGPU: true,
                enableVibrancy: true
            )
        )
    ])
    func decode(rawJson: String, expected: EagleAppInfo.Preferences.General) {
        let result = try? JSONDecoder().decode(
            EagleAppInfo.Preferences.General.self,
            from: rawJson.data(using: .utf8) ?? Data()
        )

        #expect(result == expected)
    }
}
