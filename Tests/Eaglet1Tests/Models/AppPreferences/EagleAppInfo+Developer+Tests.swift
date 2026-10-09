//
//  EagleAppInfo+Developer+Tests.swift
//  Eaglet
//
//  Created by Martônio Júnior on 08/10/2026.
//

import CustomDump
@testable import Eaglet1
import Foundation
import Testing

struct EagleAppInfoDeveloperTests {
    @Test("Decodes a json into a valid object", arguments: [
        (
            """
            {
                "apiToken": "0c87i121-umsf-7ele-8uf9-7sd96f7wuu9r"
            }
            """,
            EagleAppInfo.Preferences.Developer(
                apiToken: "0c87i121-umsf-7ele-8uf9-7sd96f7wuu9r"
            )
        )
    ])
    func decode(rawJson: String, expected: EagleAppInfo.Preferences.Developer) throws {
        let result = try JSONDecoder().decode(
            EagleAppInfo.Preferences.Developer.self,
            from: rawJson.data(using: .utf8) ?? Data()
        )

        expectNoDifference(result, expected)
    }
}
