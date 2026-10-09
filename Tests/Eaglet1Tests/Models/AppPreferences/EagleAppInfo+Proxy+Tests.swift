//
//  EagleAppInfo+Proxy+Tests.swift
//  Eaglet
//
//  Created by Martônio Júnior on 08/10/2026.
//

import CustomDump
@testable import Eaglet1
import Foundation
import Testing

struct EagleAppInfoProxyTests {
    @Test("Decodes a json into a valid object", arguments: [
        (
            """
            {
                "enable": "false",
                "ip": "127.0.0.1",
                "port": 1087
            }
            """,
            EagleAppInfo.Preferences.Proxy(
                enable: false,
                ip: "127.0.0.1",
                port: 1087
            )
        )
    ])
    func decode(rawJson: String, expected: EagleAppInfo.Preferences.Proxy) throws {
        let result = try JSONDecoder().decode(
            EagleAppInfo.Preferences.Proxy.self,
            from: rawJson.data(using: .utf8) ?? Data()
        )

        expectNoDifference(result, expected)
    }
}
