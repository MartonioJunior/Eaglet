//
//  EagleLibrary+QuickAccess+Tests.swift
//  Eaglet
//
//  Created by Martônio Júnior on 12/10/2026.
//

import CustomDump
@testable import Eaglet1
import Foundation
import Testing

struct EagleLibraryQuickAccessTests {
    @Test("Decodes a json into a valid object", arguments: [
        (
            """
            {
                "type": "smartFolder",
                "id": "7de0bdb8-3124-add7-4a1f-b51f126aa738"
            }
            """,
            EagleLibrary.QuickAccess(
                type: "smartFolder",
                id: "7de0bdb8-3124-add7-4a1f-b51f126aa738"
            )
        )
    ])
    func decode(rawJson: String, expected: EagleLibrary.QuickAccess) throws {
        let result = try JSONDecoder().decode(
            EagleLibrary.QuickAccess.self,
            from: rawJson.data(using: .utf8) ?? Data()
        )

        expectNoDifference(result, expected)
    }
}
