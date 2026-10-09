//
//  EagleAppInfo+Habits+Tests.swift
//  Eaglet
//
//  Created by Martônio Júnior on 08/10/2026.
//

import CustomDump
@testable import Eaglet1
import Foundation
import Testing

struct EagleAppInfoHabitsTests {
    @Test("Decodes a json into a valid object", arguments: [
        (
            """
            {
                "dblclickSidebarItem": "collapse",
                "scrollBehavior": "scroll",
                "videoScrollBehavior": "progress",
                "hoverZoom": "on",
                "scrollBehaviorTour": true,
                "renderBehavior": "non-pixelated",
                "defaultMode": "preview",
                "rememberLastZoom": "on",
                "defaultRatio": "auto",
                "transparency": "hide",
                "keyspace": "preview",
                "middleBtn": "openNewWindow",
                "doubleclick": "internal",
                "gifViewer": "off",
                "alwaysPlayGIF": "off",
                "imageRotateMode": "write",
                "alwaysShowAnnotations": "hover"
            }
            """,
            EagleAppInfo.Preferences.Habits(
                dblclickSidebarItem: "collapse",
                scrollBehavior: "scroll",
                videoScrollBehavior: "progress",
                hoverZoom: "on",
                scrollBehaviorTour: true,
                renderBehavior: "non-pixelated",
                defaultMode: "preview",
                rememberLastZoom: "on",
                defaultRatio: "auto",
                transparency: "hide",
                keyspace: "preview",
                middleBtn: "openNewWindow",
                doubleclick: "internal",
                gifViewer: "off",
                alwaysPlayGIF: "off",
                alwaysShowAnnotations: "hover"
            )
        )
    ])
    func decode(rawJson: String, expected: EagleAppInfo.Preferences.Habits) throws {
        let result = try JSONDecoder().decode(
            EagleAppInfo.Preferences.Habits.self,
            from: rawJson.data(using: .utf8) ?? Data()
        )

        expectNoDifference(result, expected)
    }
}
