//
//  EagleLibrary+TagGroups+Tests.swift
//  Eaglet
//
//  Created by Martônio Júnior on 12/10/2026.
//

import CustomDump
@testable import Eaglet1
import Foundation
import Testing

struct EagleLibraryTagGroupsTests {
    @Test("Decodes a json into a valid object", arguments: [
        (
            """
            {
                "id": "549c0c05-414f-b114-4832-578e77d937ab",
                "name": "Movies",
                "tags": [
                    "Justas Galaburda",
                    "Brave",
                    "Macbeth",
                    "Captain America",
                    "The Dead",
                    "Ant-Man",
                    "Missing Tags"
                ],
                "color": "red"
            }
            """,
            EagleLibrary.TagGroups(
                id: "549c0c05-414f-b114-4832-578e77d937ab",
                name: "Movies",
                tags: [
                    "Justas Galaburda",
                    "Brave",
                    "Macbeth",
                    "Captain America",
                    "The Dead",
                    "Ant-Man",
                    "Missing Tags"
                ],
                color: "red"
            )
        )
    ])
    func decode(rawJson: String, expected: EagleLibrary.TagGroups) throws {
        let result = try JSONDecoder().decode(
            EagleLibrary.TagGroups.self,
            from: rawJson.data(using: .utf8) ?? Data()
        )

        // expectNoDifference(result, expected)
        #expect(result == expected)
    }
}
