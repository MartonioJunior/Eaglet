//
//  EagleAPIRoute+Item.swift
//  SwiftKnowledge
//
//  Created by Martônio Júnior on 14/04/25.
//

public import CasePaths
public import EagletCore
import Foundation
public import URLRouting

public extension EagleRouteV1 {
    /// Route used to perform operations on items/files from an Eagle library.
    @CasePathable
    enum Item: Equatable {
        /// Adds an image to Eagle App.
        case add(Add)
        /// `GET` Get Properties of the specified file, including:
        /// - File name
        /// - Tags
        /// - Categorizations
        /// - Folders
        /// - Dimensions
        ///
        /// and more...
        case info(EagleItem.ID)
        /// `GET` Get the path of the thumbnail of the file specified.
        ///
        /// If you would like to get a batch of thumbnail paths, the combination of "Library path + Object ID" is recommended.
        case thumbnail(EagleFolder.ID)
        /// `GET` Get items that match the filter condition.
        case list(ListItems)
        /// `POST` Move items to trash.
        case moveToTrash(MoveToTrash)
        /// Perform a refresh in an aspect of the file.
        case refresh(Refresh)
        /// Sets a custom thumbnail for a file.
        case setCustomThumbnail(SetCustomThumbnail)
        /// `POST` Modify data of specified fields of the item.
        case update(UpdateItem)
        /// `GET` Get the list of folders of the current library.
        ///
        /// Same as using `.list(.init())`.
        public static var listAll: Self { .list(.init()) }
    }
}

// MARK: Self: EagleAPI.Routable
extension EagleRouteV1.Item: EagleAPI.Routable {
    // swiftlint:disable:next missing_docs
    public static var router: some Router<EagleRouteV1.Item> {
        OneOf {
            Route(.case(\.add)) {
                Add.router
            }

            Route(.case(\.info)) {
                Method.get
                Path { "info" }
                Query {
                    Field("id")
                }
            }

            Route(.case(\.thumbnail)) {
                Method.get
                Path { "thumbnail" }
                Query {
                    Field("id")
                }
            }

            Route(.case(\.list)) {
                Method.get
                Path { "list" }
                ListItems.parser
            }

            Route(.case(\.moveToTrash)) {
                Method.post
                Path { "moveToTrash" }
                Body(.json(MoveToTrash.self))
            }

            Route(.case(\.refresh)) {
                Refresh.router
            }

            Route(.case(\.setCustomThumbnail)) {
                Method.post
                Path { "setCustomThumbnail" }
                Body(.json(SetCustomThumbnail.self))
            }

            Route(.case(\.update)) {
                Method.post
                Path { "update" }
                Body(.json(UpdateItem.self))
            }
        }
    }
}

// MARK: EagleAPIRoute.Item.Add
public extension EagleRouteV1.Item {
    /// Route that adds items to the Eagle App.
    @CasePathable
    enum Add: Equatable {
        /// `POST` Adds a single item to Eagle App.
        ///
        /// If you intend to add multiple items in a row, we suggest you use `.many(_:)` instead.
        case one(ItemType)
        /// `POST` Adds multiple URL items to Eagle App.
        case manyURL(AddManyItems)
        /// `POST` Adds multiple path items to Eagle App.
        case manyPath(AddManyItems)
        /// `POST` Save the link in the URL form to Eagle App.
        case bookmark(AddBookmark)
    }
}

extension EagleRouteV1.Item.Add: Sendable {}

extension EagleRouteV1.Item.Add: EagleAPI.Routable {
    // swiftlint:disable:next missing_docs
    public static var router: some Router<EagleRouteV1.Item.Add> {
        AnyParserPrinter(
            OneOf {
                Route(.case(\.one)) {
                    ItemType.router
                }

                Route(.case(\.manyURL)) {
                    Method.post
                    OneOf {
                        Path { "addFromURLs" }
                    }
                    Body(.json(AddManyItems.self))
                }

                Route(.case(\.manyPath)) {
                    Method.post
                    OneOf {
                        Path { "addFromPaths" }
                    }
                    Body(.json(AddManyItems.self))
                }

                Route(.case(\.bookmark)) {
                    Method.post
                    Path { "addBookmark" }
                    Body(.json(AddBookmark.self))
                }
            }
        )
    }
}

// MARK: EagleAPIRoute.Item.Add.ItemType
public extension EagleRouteV1.Item.Add {
    /// Route that describes the type of item to be added.
    @CasePathable
    enum ItemType {
        /// Item is sourced from an URL address.
        case url(AddURLItem)
        /// Item is sourced from a local file.
        case path(AddPathItem)
    }
}

extension EagleRouteV1.Item.Add.ItemType: Decodable {
    public init(from decoder: any Decoder) throws {
        let container = try decoder.singleValueContainer()

        if let value = try? container.decode(AddURLItem.self) {
            self = .url(value)
        } else if let value = try? container.decode(AddPathItem.self) {
            self = .path(value)
        } else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: """
                Failed to convert an instance of \(Self.self) from "\(container)"
                """
            )
        }
    }
}

extension EagleRouteV1.Item.Add.ItemType: Encodable {
    public func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
            case let .url(url): try container.encode(url)
            case let .path(path): try container.encode(path)
        }
    }
}

extension EagleRouteV1.Item.Add.ItemType: Equatable {}
extension EagleRouteV1.Item.Add.ItemType: Sendable {}

extension EagleRouteV1.Item.Add.ItemType: EagleAPI.Routable {
    // swiftlint:disable:next missing_docs
    public static var router: some Router<EagleRouteV1.Item.Add.ItemType> {
        OneOf {
            Route(.case(\.url)) {
                Method.post
                Path { "addFromURL" }
                Body(.json(AddURLItem.self))
            }

            Route(.case(\.path)) {
                Method.post
                Path { "addFromPath" }
                Body(.json(AddPathItem.self))
            }
        }
    }
}

// MARK: EagleAPIRoute.Item.Refresh
public extension EagleRouteV1.Item {
    /// Route that performs a refresh in an aspect of the file.
    @CasePathable
    enum Refresh: Equatable {
        /// `POST` Re-analysis the color of the file.
        ///
        /// When changes to the original file were made, you can call this function to refresh the Color Analysis.
        case palette(RefreshItem)
        /// `POST` Re-generate the thumbnail of the file used to display in the List.
        ///
        /// When changes to the original file were made, you can call this function to re-generate the thumbnail, the color analysis will also be made.
        case thumbnail(RefreshItem)
    }
}

extension EagleRouteV1.Item.Refresh: Sendable {}

extension EagleRouteV1.Item.Refresh: EagleAPI.Routable {
    // swiftlint:disable:next missing_docs
    public static var router: some Router<EagleRouteV1.Item.Refresh> {
        OneOf {
            Route(.case(\.palette)) {
                Method.post
                Path { "refreshPalette" }
                Body(.json(RefreshItem.self))
            }

            Route(.case(\.thumbnail)) {
                Method.post
                Path { "refreshThumbnail" }
                Body(.json(RefreshItem.self))
            }
        }
    }
}

// MARK: Self: Sendable
extension EagleRouteV1.Item: Sendable {}
