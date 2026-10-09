//
//  EagleAppInfo+Privacy+Tests.swift
//  Eaglet
//
//  Created by Martônio Júnior on 08/10/2026.
//

import CustomDump
@testable import Eaglet1
import Foundation
import Testing

struct EagleAppInfoPrivacyTests {
    @Test("Decodes a json into a valid object", arguments: [
        (
            """
            {
                "enable": "false",
                "password": "",
                "passwordTips": ""
            }
            """,
            EagleAppInfo.Preferences.Privacy(
                enable: false,
                password: "",
                passwordTips: ""
            )
        ),
        (
            """
            {
                "enable": "true",
                "password": "1234",
                "passwordTips": "Simple Pass"
            }
            """,
            EagleAppInfo.Preferences.Privacy(
                enable: true,
                password: "1234",
                passwordTips: "Simple Pass"
            )
        )
    ])
    func decode(rawJson: String, expected: EagleAppInfo.Preferences.Privacy) throws {
        let result = try JSONDecoder().decode(
            EagleAppInfo.Preferences.Privacy.self,
            from: rawJson.data(using: .utf8) ?? Data()
        )

        expectNoDifference(result, expected)
    }
}
