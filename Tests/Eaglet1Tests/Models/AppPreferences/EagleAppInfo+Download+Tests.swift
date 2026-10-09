//
//  EagleAppInfo+Download+Tests.swift
//  Eaglet
//
//  Created by Martônio Júnior on 08/10/2026.
//

import CustomDump
@testable import Eaglet1
import Foundation
import Testing

struct EagleAppInfoDownloadTests {
    @Test("Decodes a json into a valid object", arguments: [
        (
            """
            {
                "queueLength": 5
            }
            """,
            EagleAppInfo.Preferences.Download(
                queueLength: 5
            )
        )
    ])
    func decode(rawJson: String, expected: EagleAppInfo.Preferences.Download) throws {
        let result = try JSONDecoder().decode(
            EagleAppInfo.Preferences.Download.self,
            from: rawJson.data(using: .utf8) ?? Data()
        )

        expectNoDifference(result, expected)
    }
}
