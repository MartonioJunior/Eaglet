//
//  EagleAppInfo+Tests.swift
//  Eaglet
//
//  Created by Martônio Júnior on 23/10/2026.
//

import CustomDump
@testable import Eaglet2
import Foundation
import Testing

struct EagleAppInfoTests {
    @Test("Decodes a json into a valid object", arguments: [
        (EagleAppInfo.mockJSON, EagleAppInfo.mockData)
    ])
    func decode(rawJson: String, expected: EagleAppInfo) throws {
        let result = try JSONDecoder().decode(
            EagleAppInfo.self,
            from: rawJson.data(using: .utf8) ?? Data()
        )

        expectNoDifference(result, expected)
    }
}

// MARK: EagleAppInfo (EX)
public extension EagleAppInfo {
    static var mockJSON: String {
        """
        {
            "version": "4.0.0",
            "prereleaseVersion": null,
            "buildVersion": "build12",
            "platform": "win32"
        }
        """
    }

    static var mockData: Self {
        .init(
            version: "4.0.0",
            prereleaseVersion: nil,
            buildVersion: "build12",
            platform: "win32"
        )
    }
}
