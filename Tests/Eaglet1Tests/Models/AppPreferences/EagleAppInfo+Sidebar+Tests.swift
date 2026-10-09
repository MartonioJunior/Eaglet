//
//  EagleAppInfo+Sidebar+Tests.swift
//  Eaglet
//
//  Created by Martônio Júnior on 08/10/2026.
//

import CustomDump
@testable import Eaglet1
import Foundation
import Testing

struct EagleAppInfoSidebarTests {
    @Test("Decodes a json into a valid object", arguments: [
        (
            """
            {
                "untagged": "true",
                "unfiled": "true",
                "recent": "true",
                "random": "true",
                "community2": "true",
                "quickAccess": "true",
                "smartFolder": "true",
                "folder": "true"
            }
            """,
            EagleAppInfo.Preferences.Sidebar(
                untagged: true,
                unfiled: true,
                recent: true,
                random: true,
                community2: true,
                quickAccess: true,
                smartFolder: true,
                folder: true
            )
        )
    ])
    func decode(rawJson: String, expected: EagleAppInfo.Preferences.Sidebar) throws {
        let result = try JSONDecoder().decode(
            EagleAppInfo.Preferences.Sidebar.self,
            from: rawJson.data(using: .utf8) ?? Data()
        )

        expectNoDifference(result, expected)
    }
}
