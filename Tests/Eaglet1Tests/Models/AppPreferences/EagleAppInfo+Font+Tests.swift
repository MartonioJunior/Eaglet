//
//  EagleAppInfo+Font+Tests.swift
//  Eaglet
//
//  Created by Martônio Júnior on 08/10/2026.
//

@testable import Eaglet1
import Foundation
import Testing

struct EagleAppInfoFontTests {
    @Test("Decodes a json into a valid object", arguments: [
        (
            """
            {
                "autoTag": "true"
            }
            """,
            EagleAppInfo.Preferences.Font(
                autoTag: true
            )
        )
    ])
    func decode(rawJson: String, expected: EagleAppInfo.Preferences.Font) {
        let result = try? JSONDecoder().decode(
            EagleAppInfo.Preferences.Font.self,
            from: rawJson.data(using: .utf8) ?? Data()
        )

        #expect(result == expected)
    }
}
