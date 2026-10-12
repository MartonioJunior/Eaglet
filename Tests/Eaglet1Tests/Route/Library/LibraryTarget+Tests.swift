//
//  LibraryTarget+Tests.swift
//  Eaglet
//
//  Created by Martônio Júnior on 12/10/2026.
//

import CustomDump
@testable import Eaglet1
import Foundation
import Testing

struct LibraryTargetTests {
    @Test("Decodes a json into a valid request", arguments: [
        (
            """
            {
                "libraryPath": "/Users/augus/Pictures/Design.library"
            }
            """,
            LibraryTarget("/Users/augus/Pictures/Design.library")
        )
    ])
    func decodeInput(rawJson: String, expected: LibraryTarget) throws {
        let result = try JSONDecoder().decode(
            LibraryTarget.self,
            from: rawJson.data(using: .utf8) ?? Data()
        )

        expectNoDifference(result, expected)
    }
}
