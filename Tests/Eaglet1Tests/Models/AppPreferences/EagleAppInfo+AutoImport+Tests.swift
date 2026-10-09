//
//  EagleAppInfo+AutoImport+Tests.swift
//  Eaglet
//
//  Created by Martônio Júnior on 08/10/2026.
//

import CustomDump
@testable import Eaglet1
import Foundation
import Testing

struct EagleAppInfoAutoImportTests {
    @Test("Decodes a json into a valid object", arguments: [
        (
            """
            {
                "enable": "true",
                "path": "/Documents/Eagle Clipboard"
            }
            """,
            EagleAppInfo.Preferences.AutoImport(
                enable: true,
                path: "/Documents/Eagle Clipboard"
            )
        )
    ])
    func decode(rawJson: String, expected: EagleAppInfo.Preferences.AutoImport) throws {
        let result = try JSONDecoder().decode(
            EagleAppInfo.Preferences.AutoImport.self,
            from: rawJson.data(using: .utf8) ?? Data()
        )

        expectNoDifference(result, expected)
    }
}
