//
//  EagleAPIRoute+Item.swift
//  SwiftKnowledge
//
//  Created by Martônio Júnior on 14/04/25.
//

public import CasePaths
public import Common
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
        case info(EagleFolder.ID)
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
                Path { "info" }
                Query {
                    Field("id")
                }
            }

            Route(.case(\.thumbnail)) {
                Path { "thumbnail" }
                Query {
                    Field("id")
                }
            }

            Route(.case(\.list)) {
                Path { "list" }
                Parse(.memberwise(ListItems.init)) {
                    Query {
                        Field("limit", default: 200) { Digits() }
                        Field("offset", default: 0) { Digits() }
                        Field("orderBy", default: ListItems.SortingOptions(.ascending, .name)) {
                            ListItems.SortingOptions.parser
                        }
                        Optionally {
                            Field("keyword", default: nil)
                        }
                        Optionally {
                            Field("ext", default: nil)
                        }
                        Optionally {
                            Field("tags", default: nil) {
                                Many {
                                    Parse(.string)
                                } separator: {
                                    ",".utf8
                                }
                            }
                        }
                        Optionally {
                            Field("folders", default: nil) {
                                Many {
                                    Parse(.string)
                                } separator: {
                                    ",".utf8
                                }
                            }
                        }
                    }
                }
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
                Path { "setCustomThumbnail" }
                Body(.json(SetCustomThumbnail.self)) // TODO: Replace with the correct parsing system
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
        /// `POST` Adds multiple items to Eagle App.
        case many(AddManyItems)
        /// `POST` Save the link in the URL form to Eagle App.
        case bookmark(AddBookmark)
    }
}

extension EagleRouteV1.Item.Add: Sendable {}

extension EagleRouteV1.Item.Add: EagleAPI.Routable {
    // swiftlint:disable:next missing_docs
    public static var router: some Router<EagleRouteV1.Item.Add> {
        OneOf {
            Route(.case(\.one)) {
                ItemType.router
            }

            Route(.case(\.many)) {
                Method.post
                OneOf {
                    Path { "addFromURLs" }
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
    }
}

// MARK: EagleAPIRoute.Item.Add.ItemType
public extension EagleRouteV1.Item.Add {
    /// Route that describes the type of item to be added.
    @CasePathable
    enum ItemType: Codable, Equatable {
        /// Item is sourced from an URL address.
        case url(AddURLItem)
        /// Item is sourced from a local file.
        case path(AddPathItem)
    }
}

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
