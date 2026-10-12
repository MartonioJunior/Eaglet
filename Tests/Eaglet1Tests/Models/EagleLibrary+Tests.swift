//
//  EagleLibrary+Tests.swift
//  Eaglet
//
//  Created by Martônio Júnior on 11/10/2026.
//

import CustomDump
@testable import Eaglet1
import Foundation
import Testing

struct EagleLibraryTests {
    @Test("Decodes a json into a valid object", arguments: [
        (EagleLibrary.mockJSON, EagleLibrary.mockData)
    ])
    func decode(rawJson: String, expected: EagleLibrary) throws {
        let result = try JSONDecoder().decode(
            EagleLibrary.self,
            from: rawJson.data(using: .utf8) ?? Data()
        )

        expectNoDifference(result, expected)
    }
}
