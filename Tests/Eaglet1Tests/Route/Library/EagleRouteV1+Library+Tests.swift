//
//  EagleRouteV1+Library+Tests.swift
//  Eaglet
//
//  Created by Martônio Júnior on 12/10/2026.
//

import Common
import CustomDump
@testable import Eaglet1
import Foundation
import Testing
import URLRouting

struct EagletRouteV1LibraryTests {
    @Test("Obtains information about the active library")
    func getActiveLibraryInfo() async throws {
        let client: URLRoutingClient<EagleRouteV1> = .failing.override(.library(.info)) {
            try .ok(EagleAPI.Response<EagleLibrary>(.mockData, status: "success"))
        }

        let result = try await client.getActiveLibraryInfo()
        let expected = EagleLibrary.mockData

        expectNoDifference(result, expected)
    }

    @Test("Obtains the icon for a library", arguments: [
        (LibraryTarget("/Sandbox.library"), EagleImage())
    ])
    func icon(for library: LibraryTarget, expected: EagleImage) async throws {
        let client: URLRoutingClient<EagleRouteV1> = .failing.override(.library(.icon(library.libraryPath))) {
            try .ok(EagleAPI.Response<EagleImage>(expected, status: "success"))
        }

        let result = try await client.icon(for: library)

        expectNoDifference(result, expected)
    }

    @Test("Obtains information about the library history in Eagle", arguments:  [
        (
            [
                "/Sandbox.library",
                "/Documents/Jukebox.library"
            ]
        )
    ])
    func libraryHistory(expected: [EagleLibrary.Path]) async throws {
        let client: URLRoutingClient<EagleRouteV1> = .failing.override(.library(.history)) {
            try .ok(EagleAPI.Response<[EagleLibrary.Path]>(expected, status: "success"))
        }

        let result = try await client.libraryHistory()

        expectNoDifference(result, expected)
    }

    @Test("Switches the active library", arguments: [
        (LibraryTarget("/Sandbox.library"), EagleAPI.VoidResponse("success"))
    ])
    func switchLibrary(to target: LibraryTarget, expected: EagleAPI.VoidResponse) async throws {
        let client: URLRoutingClient<EagleRouteV1> = .failing.override(.library(.switch(target.libraryPath))) {
            try .ok(expected)
        }

        let result = try await client.switchLibrary(to: target)

        expectNoDifference(result, expected)
    }
}
