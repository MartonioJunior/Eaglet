//
//  AnyParserPrinter+Tests.swift
//  Eaglet
//
//  Created by Martônio Júnior on 23/10/2026.
//

import CustomDump
@testable import EagletCore
import Foundation
import Testing
import URLRouting

struct AnyParserPrinterTests {
    @Test("Evaluates parser printing for a list of elements.", arguments: [
        (
            ["KAY6NTU6UYI5Q", "KBJ8Z60O88VMG"],
            "KAY6NTU6UYI5Q,KBJ8Z60O88VMG"
        ),
        (
            ["KAY6NTU6UYI5Q", "KBJ8Z60O88VMG", "LKFIGUSFUS"],
            "KAY6NTU6UYI5Q,KBJ8Z60O88VMG,LKFIGUSFUS"
        )
    ])
    func listParser(_ data: [String], expected: String) throws {
        var output = try AnyParserPrinter.listParser().print(data)
        if let delta = diff(String(output), expected) {
            Issue.record(Comment(rawValue: delta))
        } else {
            #expect(output == expected)
        }

        let input = try AnyParserPrinter.listParser().parse(&output)
        if let delta = diff(input, data) {
            Issue.record(Comment(rawValue: delta))
        } else {
            #expect(input == data)
        }
    }
}