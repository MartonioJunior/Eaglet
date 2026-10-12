//
//  ListItems+Tests.swift
//  Eaglet
//
//  Created by Martônio Júnior on 09/10/2026.
//

import CustomDump
@testable import Eaglet1
import Foundation
import Testing
import URLRouting

struct ListItemsTests {
    @Test("Decodes a json into a valid request", arguments: [
        (
            """
            {
                "limit": 30,
                "offset": 5,
                "orderBy": "FILESIZE",
                "keyword": "ball",
                "ext": "jpg",
                "tags": "Design,Goal",
                "folders": "KAY6NTU6UYI5Q,KBJ8Z60O88VMG"
            }
            """,
            ListItems(
                limit: 30,
                offset: 5,
                orderBy: .init(.ascending, .fileSize),
                keyword: "ball",
                extensionType: "jpg",
                tags: ["Design", "Goal"],
                folders: ["KAY6NTU6UYI5Q", "KBJ8Z60O88VMG"]
            )
        ),
        (
            """
            {
                "offset": 5,
                "orderBy": "CREATEDATE",
                "keyword": "ball",
                "ext": "jpg",
                "tags": "Design,Goal",
                "folders": "KAY6NTU6UYI5Q,KBJ8Z60O88VMG"
            }
            """,
            ListItems(
                limit: 200,
                offset: 5,
                orderBy: .init(.ascending, .creationDate),
                keyword: "ball",
                extensionType: "jpg",
                tags: ["Design", "Goal"],
                folders: ["KAY6NTU6UYI5Q", "KBJ8Z60O88VMG"]
            )
        ),
        (
            """
            {
                "limit": 30,
                "orderBy": "RESOLUTION",
                "keyword": "ball",
                "ext": "jpg",
                "tags": "Design,Goal",
                "folders": "KAY6NTU6UYI5Q,KBJ8Z60O88VMG"
            }
            """,
            ListItems(
                limit: 30,
                offset: 0,
                orderBy: .init(.ascending, .resolution),
                keyword: "ball",
                extensionType: "jpg",
                tags: ["Design", "Goal"],
                folders: ["KAY6NTU6UYI5Q", "KBJ8Z60O88VMG"]
            )
        ),
        (
            """
            {
                "limit": 30,
                "offset": 5,
                "orderBy": "-CREATEDATE",
                "ext": "jpg",
                "tags": "Design,Goal",
                "folders": "KAY6NTU6UYI5Q,KBJ8Z60O88VMG"
            }
            """,
            ListItems(
                limit: 30,
                offset: 5,
                orderBy: .init(.descending, .creationDate),
                extensionType: "jpg",
                tags: ["Design", "Goal"],
                folders: ["KAY6NTU6UYI5Q", "KBJ8Z60O88VMG"]
            )
        ),
        (
            """
            {
                "limit": 30,
                "offset": 5,
                "orderBy": "NAME",
                "keyword": "ball",
                "tags": "Design,Goal",
                "folders": "KAY6NTU6UYI5Q,KBJ8Z60O88VMG"
            }
            """,
            ListItems(
                limit: 30,
                offset: 5,
                orderBy: .init(.ascending, .name),
                keyword: "ball",
                tags: ["Design", "Goal"],
                folders: ["KAY6NTU6UYI5Q", "KBJ8Z60O88VMG"]
            )
        ),
        (
            """
            {
                "limit": 30,
                "offset": 5,
                "orderBy": "-RESOLUTION",
                "keyword": "ball",
                "ext": "jpg",
                "folders": "KAY6NTU6UYI5Q,KBJ8Z60O88VMG"
            }
            """,
            ListItems(
                limit: 30,
                offset: 5,
                orderBy: .init(.descending, .resolution),
                keyword: "ball",
                extensionType: "jpg",
                folders: ["KAY6NTU6UYI5Q", "KBJ8Z60O88VMG"]
            )
        ),
        (
            """
            {
                "limit": 30,
                "offset": 5,
                "orderBy": "-FILESIZE",
                "keyword": "ball",
                "ext": "jpg",
                "tags": "Design,Goal",
            }
            """,
            ListItems(
                limit: 30,
                offset: 5,
                orderBy: .init(.descending, .fileSize),
                keyword: "ball",
                extensionType: "jpg",
                tags: ["Design", "Goal"],
            )
        )
    ])
    func decodeInput(rawJson: String, expected: ListItems) throws {
        let result = try JSONDecoder().decode(
            ListItems.self,
            from: rawJson.data(using: .utf8) ?? Data()
        )

        expectNoDifference(result, expected)
    }

    @Test("Evaluates parser printing for an output.", arguments: [
        (
            ListItems(
                limit: 30,
                offset: 0,
                orderBy: ListItems.SortingOptions(.ascending, .resolution),
                keyword: "ball",
                extensionType: "jpg",
                tags: ["Design", "Goal"],
                folders: ["KAY6NTU6UYI5Q", "KBJ8Z60O88VMG"]
            ),
            URLRequestData(query: [
                "limit": ["30"],
                "orderBy": ["RESOLUTION"],
                "keyword": ["ball"],
                "ext": ["jpg"],
                "tags": ["Design,Goal"],
                "folders": ["KAY6NTU6UYI5Q,KBJ8Z60O88VMG"]
            ])
        )
    ])
    func parser(_ data: ListItems, expected: URLRequestData) throws {
        let output = try ListItems.parser.print(data)
        if let delta = diff(output, expected) {
            Issue.record(Comment(rawValue: delta))
        } else {
            #expect(output == expected)
        }
    }

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
        var output = try ListItems.listParser.print(data)
        if let delta = diff(String(output), expected) {
            Issue.record(Comment(rawValue: delta))
        } else {
            #expect(output == expected)
        }

        let input = try ListItems.listParser.parse(&output)
        if let delta = diff(input, data) {
            Issue.record(Comment(rawValue: delta))
        } else {
            #expect(input == data)
        }
    }

    @Test("Evaluates parser printing for sort options.", arguments: [
        (ListItems.SortingOptions(.ascending, .creationDate), "CREATEDATE"),
        (ListItems.SortingOptions(.descending, .creationDate), "-CREATEDATE"),
        (ListItems.SortingOptions(.ascending, .fileSize), "FILESIZE"),
        (ListItems.SortingOptions(.descending, .fileSize), "-FILESIZE"),
        (ListItems.SortingOptions(.ascending, .name), "NAME"),
        (ListItems.SortingOptions(.descending, .name), "-NAME"),
        (ListItems.SortingOptions(.ascending, .resolution), "RESOLUTION"),
        (ListItems.SortingOptions(.descending, .resolution), "-RESOLUTION")
    ])
    func sortOptionsParser(_ data: ListItems.SortingOptions, expected: String) throws {
        var output = try ListItems.SortingOptions.parser.print(data)
        if let delta = diff(String(output), expected) {
            Issue.record(Comment(rawValue: delta))
        } else {
            #expect(output == expected)
        }

        let input = try ListItems.SortingOptions.parser.parse(&output)
        if let delta = diff(input, data) {
            Issue.record(Comment(rawValue: delta))
        } else {
            #expect(input == data)
        }
    }

    @Test("Evaluates parser printing for sort parameter.", arguments: [
        (ListItems.SortParameter.creationDate, "CREATEDATE"),
        (ListItems.SortParameter.fileSize, "FILESIZE"),
        (ListItems.SortParameter.name, "NAME"),
        (ListItems.SortParameter.resolution, "RESOLUTION")
    ])
    func sortParameterParser(_ data: ListItems.SortParameter, expected: String) throws {
        var output = try ListItems.SortParameter.parser.print(data)
        if let delta = diff(String(output), expected) {
            Issue.record(Comment(rawValue: delta))
        } else {
            #expect(output == expected)
        }

        let input = try ListItems.SortParameter.parser.parse(&output)
        if let delta = diff(input, data) {
            Issue.record(Comment(rawValue: delta))
        } else {
            #expect(input == data)
        }
    }

    @Test("Evaluates parser printing for sort order.", arguments: [
        (ListItems.SortOrder.ascending, ""),
        (ListItems.SortOrder.descending, "-")
    ])
    func sortOrderParser(_ data: ListItems.SortOrder, expected: String) throws {
        var output = try ListItems.SortOrder.parser.print(data)
        if let delta = diff(String(output), expected) {
            Issue.record(Comment(rawValue: delta))
        } else {
            #expect(output == expected)
        }

        let input = try ListItems.SortOrder.parser.parse(&output)
        if let delta = diff(input, data) {
            Issue.record(Comment(rawValue: delta))
        } else {
            #expect(input == data)
        }
    }
}
