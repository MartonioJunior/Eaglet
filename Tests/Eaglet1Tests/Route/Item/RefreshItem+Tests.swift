//
//  RefreshItem+Tests.swift
//  Eaglet
//
//  Created by Martônio Júnior on 09/10/2026.
//

import CustomDump
@testable import Eaglet1
import Foundation
import Testing

struct RefreshItemTests {
    @Test("Decodes a json into a valid request", arguments: [
        (
            """
            {
                "id": "KBKE02W8V0YWD"
            }
            """,
            RefreshItem(id: "KBKE02W8V0YWD")
        )
    ])
    func decodeInput(rawJson: String, expected: RefreshItem) throws {
        let result = try JSONDecoder().decode(
            RefreshItem.self,
            from: rawJson.data(using: .utf8) ?? Data()
        )

        expectNoDifference(result, expected)
    }
}
