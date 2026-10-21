//
//  ListItems.swift
//  SwiftKnowledge
//
//  Created by Martônio Júnior on 14/04/25.
//

public import EagletCore
import Parsing
public import URLRouting

/// Data structure with the necessary information to query an Eagle Library
/// for a list of items.
public struct ListItems {
    // MARK: Variables
    /// Number of items to be displayed. 
    var limit: Int
    /// Offsets a collection of results from the API.
    var offset: Int
    /// Sorting order of the list.
    var orderBy: SortingOptions
    /// If this parameter is defined, filters the list by the keyword.
    var keyword: String?
    /// If this parameter is defined, filters the list by the extension type (e.g. jpg, png)
    var ext: String?
    /// If this parameter is defined, filters the list by tags.
    var tags: [String]?
    /// If this parameter is defined, filters the list by folders.
    var folders: [EagleFolder.ID]?
    // MARK: Initializers
    /// Defines a list items operation.
    /// - Parameters:
    ///   - limit: Number of items to be displayed. 
    ///   - offset: Offsets a collection of results from the API.
    ///   - orderBy: Sorting order of the list.
    ///   - keyword: If this parameter is defined, filters the list by the keyword.
    ///   - extensionType: If this parameter is defined, filters the list by the extension type.
    ///   - tags: If this parameter is defined, filters the list by tags.
    ///   - folders: If this parameter is defined, filters the list by folders.
    ///
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
    static var parser: AnyParserPrinter<URLRequestData, Self> {
        Parse(.memberwise(Self.init)) {
            Query {
                Field("limit", default: 200) { Digits() }
                Field("offset", default: 0) { Digits() }
                Field("orderBy", default: SortingOptions(.ascending, .name)) {
                    Self.SortingOptions.parser
                }

                Optionally {
                    Field("keyword", default: nil)
                }
                Optionally {
                    Field("ext", default: nil)
                }
                Optionally {
                    Field("tags", default: nil) {
                        AnyParserPrinter.listParser()
                    }
                }
                Optionally {
                    Field("folders", default: nil) {
                        AnyParserPrinter.listParser()
                    }
                }
            }
        }.eraseToAnyParserPrinter()
    }
}

// MARK: Self.Output
public extension ListItems {
    typealias Output = [EagleItem]
}

// MARK: ListItems.SortingOptions
public extension ListItems {
    /// Data structure describing all sorting options for a list of items
    /// from an Eagle Library.
    struct SortingOptions {
        /// Parser for sorting options.
        static var parser: AnyParserPrinter<Substring, Self> {
            OneOf {
                "CREATEDATE".map { Self(.ascending, .creationDate) }
                "-CREATEDATE".map { Self(.descending, .creationDate) }
                "FILESIZE".map { Self(.ascending, .fileSize) }
                "-FILESIZE".map { Self(.descending, .fileSize) }
                "NAME".map { Self(.ascending, .name) }
                "-NAME".map { Self(.descending, .name) }
                "RESOLUTION".map { Self(.ascending, .resolution) }
                "-RESOLUTION".map { Self(.descending, .resolution) }
            }.eraseToAnyParserPrinter()
        }
        /// Parameter that the sorting will be based on.
        var parameter: SortParameter
        /// Sorting order for the parameter.
        var order: SortOrder
        /// Defines options for sorting.
        /// - Parameters:
        ///   - order: Sorting order for the parameter.
        ///   - parameter: Parameter that the sorting will be based on.
        ///
        public init(
            _ order: SortOrder = .ascending,
            _ parameter: SortParameter = .name
        ) {
            self.parameter = parameter
            self.order = order
        }
    }
    /// Property from an Eagle item used in the sorting process.
    enum SortParameter: String, Codable, Sendable {
        /// Sorts based on the date an item was created.
        case creationDate = "CREATEDATE"
        /// Sorts based on the file size of an item.
        case fileSize = "FILESIZE"
        /// Sorts based on the name of the item.
        case name = "NAME"
        /// Sorts based on the resolution of the item.
        case resolution = "RESOLUTION"
        /// Parser for the sort parameter.
        static var parser: some ParserPrinter<Substring, Self> {
            Parse(.string).map(.representing(Self.self))
        }
    }
    /// Sorting order used when listing items based on a parameter.
    enum SortOrder: Codable, Sendable {
        /// Items are ordered in ascending order.
        case ascending
        /// Items are ordered in descending order.
        case descending
        /// Parser for the sort order.
        static var parser: some ParserPrinter<Substring, Self> {
            StartsWith("-").map { Self.descending }.replaceError(with: .ascending)
        }
    }
}

extension ListItems.SortingOptions: Decodable {
    public init(from decoder: any Decoder) throws {
        let container = try decoder.singleValueContainer()
        let string = try container.decode(String.self)

        guard let value = try? Self.parser.parse(Substring(string)) else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: """
                Failed to convert an instance of \(ListItems.SortingOptions.self) from "\(string)"
                """
            )
        }

        self = value
    }
}

extension ListItems.SortingOptions: Encodable {
    public func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(String(Self.parser.print(self)))
    }
}
extension ListItems.SortingOptions: Equatable {}
extension ListItems.SortingOptions: Sendable {}

// MARK: Self: Codable
extension ListItems: Codable {
    enum CodingKeys: String, CodingKey {
        case limit // swiftlint:disable:this explicit_enum_raw_value
        case offset // swiftlint:disable:this explicit_enum_raw_value
        case orderBy // swiftlint:disable:this explicit_enum_raw_value
        case keyword // swiftlint:disable:this explicit_enum_raw_value
        case ext // swiftlint:disable:this explicit_enum_raw_value
        case tags // swiftlint:disable:this explicit_enum_raw_value
        case folders // swiftlint:disable:this explicit_enum_raw_value
    }

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.limit = try container.decodeIfPresent(Int.self, forKey: .limit) ?? 200
        self.offset = try container.decodeIfPresent(Int.self, forKey: .offset) ?? 0
        self.orderBy = try container.decode(SortingOptions.self, forKey: .orderBy)
        self.keyword = try container.decodeIfPresent(String.self, forKey: .keyword)
        self.ext = try container.decodeIfPresent(String.self, forKey: .ext)
        self.tags = try container.decodeIfPresent(String.self, forKey: .tags)?.split(separator: ",").map(String.init)
        self.folders = try container.decodeIfPresent(String.self, forKey: .folders)?.split(separator: ",").map(String.init)
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(limit, forKey: .limit)
        try container.encode(offset, forKey: .offset)
        try container.encode(orderBy, forKey: .orderBy)
        try container.encode(keyword, forKey: .keyword)
        try container.encode(ext, forKey: .ext)
        try container.encode(tags?.joined(separator: ","), forKey: .tags)
        try container.encode(folders?.joined(separator: ","), forKey: .folders)
    }
}

// MARK: Self: Equatable
extension ListItems: Equatable {}

// MARK: Self: Sendable
extension ListItems: Sendable {}
