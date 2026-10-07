//
//  ListItems.swift
//  SwiftKnowledge
//
//  Created by Martônio Júnior on 14/04/25.
//

import Parsing

public struct ListItems: Codable, Equatable, @unchecked Sendable {
    // MARK: Variables
    var limit: Int
    var offset: Int
    var orderBy: SortingOptions
    var keyword: String?
    var ext: String?
    var tags: [String]?
    var folders: [EagleFolder.ID]?

    // MARK: Initializers
    public init(
        limit: Int = 200,
        offset: Int = 0,
        orderBy: SortingOptions = .init(),
        keyword: String? = nil,
        extensionType: String? = nil,
        tags: [String]? = nil,
        folders: [EagleFolder.ID]? = nil
    ) {
        self.limit = limit
        self.offset = offset
        self.orderBy = orderBy
        self.keyword = keyword
        self.ext = extensionType
        self.tags = tags
        self.folders = folders
    }
}

// MARK: DotSyntax
public extension ListItems {
    static func parse(
        limit: Int,
        offset: Int,
        orderBy: SortingOptions,
        keyword: String,
        ext: String,
        tags: [String],
//        folders: [String]
    ) -> Self {
        .init(
            limit: limit,
            offset: offset,
            orderBy: orderBy,
            keyword: keyword,
            extensionType: ext,
            tags: tags,
            folders: []
        )
    }
}

// MARK: ListItems.SortingOptions
public extension ListItems {
    struct SortingOptions: Codable, Equatable, Sendable {
        var parameter: SortParameter
        var order: SortOrder

        public init(
            _ order: SortOrder = .ascending,
            _ parameter: SortParameter = .name
        ) {
            self.parameter = parameter
            self.order = order
        }

        static var parser: AnyParserPrinter<Substring, SortingOptions> {
            Parse(.memberwise(SortingOptions.init)) {
                SortOrder.parser
                SortParameter.parser
            }.eraseToAnyParserPrinter()
        }
    }

    enum SortParameter: String, Codable, Sendable {
        case creationDate = "CREATEDATE"
        case fileSize = "FILESIZE"
        case name = "NAME"
        case resolution = "RESOLUTION"

        static var parser: some ParserPrinter<Substring, SortParameter> {
            OneOf {
                "CREATEDATE".map { SortParameter.creationDate }
                "FILESIZE".map { SortParameter.fileSize }
                "NAME".map { SortParameter.name }
                "RESOLUTION".map { SortParameter.resolution }
            }
        }
    }

    enum SortOrder: Codable, Sendable {
        case ascending
        case descending

        static var parser: some ParserPrinter<Substring, SortOrder> {
            "-".map { Self.descending }.replaceError(with: .ascending)
        }
    }
}
