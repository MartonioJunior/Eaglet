//
//  EagleAppInfo+Tests.swift
//  Eaglet
//
//  Created by Martônio Júnior on 08/10/2026.
//

@testable import Eaglet1
import Foundation
import Testing

struct EagleAppInfoTests {
    @Test("Decodes a json into a valid object", arguments: [
        (EagleAppInfo.mockJSON, EagleAppInfo.mockData)
    ])
    func decode(rawJson: String, expected: EagleAppInfo) {
        let result = try? JSONDecoder().decode(
            EagleAppInfo.self,
            from: rawJson.data(using: .utf8) ?? Data()
        )

        #expect(result == expected)
    }
}
