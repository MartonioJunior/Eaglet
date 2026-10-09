//
//  EagleRouteV1+Application+Tests.swift
//  Eaglet
//
//  Created by Martônio Júnior on 09/10/2026.
//

import CustomDump
@testable import Eaglet1
import Foundation
import Testing
import URLRouting

struct EagletRouteV1ApplicationTests {
    @Test("Obtains application information")
    func getApplicationInfo() async throws {
        let client: URLRoutingClient<EagleRouteV1> = .failing.override(.application(.info)) {
            try .ok(EagleAppInfo.mockData)
        }

        let result = try await client.getAppInfo()
        let expected = EagleAppInfo.mockData

        expectNoDifference(result, expected)
    }
}
