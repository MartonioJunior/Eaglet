//
//  EagleAPIRoute+Item.swift
//  SwiftKnowledge
//
//  Created by Martônio Júnior on 14/04/25.
//

public import Common
public import CasePaths
import Foundation
public import URLRouting

public extension EagleAPIRoute {
    @CasePathable
    enum Item: Equatable {
        case add(Add)
        case info(EagleFolder.ID)
        case thumbnail(EagleFolder.ID)
        case list(ListItems)
        case moveToTrash(MoveToTrash)
        case refresh(Refresh)
        case setCustomThumbnail(SetCustomThumbnail)
        case update(UpdateItem)

        public static var listAll: Self { .list(.init()) }
    }
}

// MARK: Self: EagleAPI.Routable
extension EagleAPIRoute.Item: EagleAPI.Routable {
    // swiftlint:disable:next missing_docs
    public static var router: some Router<EagleAPIRoute.Item> {
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
public extension EagleAPIRoute.Item {
    @CasePathable
    enum Add: Equatable {
        case one(ItemType)
        case many(AddManyItems)
        case bookmark(AddBookmark)
    }
}

extension EagleAPIRoute.Item.Add: Sendable {}

extension EagleAPIRoute.Item.Add: EagleAPI.Routable {
    // swiftlint:disable:next missing_docs
    public static var router: some Router<EagleAPIRoute.Item.Add> {
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
public extension EagleAPIRoute.Item.Add {
    @CasePathable
    enum ItemType: Codable, Equatable {
        case url(AddURLItem)
        case path(AddPathItem)
    }
}

extension EagleAPIRoute.Item.Add.ItemType: Sendable {}

extension EagleAPIRoute.Item.Add.ItemType: EagleAPI.Routable {
    // swiftlint:disable:next missing_docs
    public static var router: some Router<EagleAPIRoute.Item.Add.ItemType> {
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
public extension EagleAPIRoute.Item {
    @CasePathable
    enum Refresh: Equatable {
        case palette(RefreshItem)
        case thumbnail(RefreshItem)
    }
}

extension EagleAPIRoute.Item.Refresh: Sendable {}

extension EagleAPIRoute.Item.Refresh: EagleAPI.Routable {
    // swiftlint:disable:next missing_docs
    public static var router: some Router<EagleAPIRoute.Item.Refresh> {
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
extension EagleAPIRoute.Item: Sendable {}
