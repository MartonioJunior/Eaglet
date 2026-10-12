//
//  EagleLibrary+Info+Tests.swift
//  Eaglet
//
//  Created by Martônio Júnior on 11/10/2026.
//

import CustomDump
@testable import Eaglet1
import Foundation
import Testing

struct EagleLibraryInfoTests {
    @Test("Decodes a json into a valid object", arguments: [
        (
            """
            {
                "path": "/Documents/Sandbox.library",
                "name": "Sandbox"
            }
            """,
            EagleLibrary.Info(
                path: "/Documents/Sandbox.library",
                name: "Sandbox"
            )
        )
    ])
    func decode(rawJson: String, expected: EagleLibrary.Info) throws {
        let result = try JSONDecoder().decode(
            EagleLibrary.Info.self,
            from: rawJson.data(using: .utf8) ?? Data()
        )

        expectNoDifference(result, expected)
    }
}
