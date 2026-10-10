//
//  MoveToTrash+Tests.swift
//  Eaglet
//
//  Created by Martônio Júnior on 09/10/2026.
//

import CustomDump
@testable import Eaglet1
import Foundation
import Testing

struct MoveToTrashTests {
    @Test("Decodes a json into a valid request", arguments: [
        (
            """
            {
                "itemIds": ["KWLKGQW2HTHC7", "KWLOGLTX0FGHF"]
            }
            """,
            MoveToTrash(itemIds: ["KWLKGQW2HTHC7", "KWLOGLTX0FGHF"])
        )
    ])
    func decodeInput(rawJson: String, expected: MoveToTrash) throws {
        let result = try JSONDecoder().decode(
            MoveToTrash.self,
            from: rawJson.data(using: .utf8) ?? Data()
        )

        expectNoDifference(result, expected)
    }
}
