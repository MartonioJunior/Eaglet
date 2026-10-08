//
//  ListItems.swift
//  SwiftKnowledge
//
//  Created by Martônio Júnior on 14/04/25.
//

import Parsing

/// Data structure with the necessary information to query an Eagle Library
/// for a list of items.
public struct ListItems: Codable, Equatable, @unchecked Sendable {
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

// MARK: ListItems.SortingOptions
public extension ListItems {
    /// Data structure describing all sorting options for a list of items
    /// from an Eagle Library.
    struct SortingOptions: Codable, Equatable, Sendable {
        /// Parser for sorting options.
        static var parser: AnyParserPrinter<Substring, Self> {
            Parse(.memberwise(Self.init)) {
                SortOrder.parser
                SortParameter.parser
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
            OneOf {
                "CREATEDATE".map { Self.creationDate }
                "FILESIZE".map { Self.fileSize }
                "NAME".map { Self.name }
                "RESOLUTION".map { Self.resolution }
            }
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
            "-".map { Self.descending }.replaceError(with: .ascending)
        }
    }
}
