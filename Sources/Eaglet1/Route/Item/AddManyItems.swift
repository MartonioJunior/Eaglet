//
//  AddMany.swift
//  SwiftKnowledge
//
//  Created by Martônio Júnior on 14/04/25.
//

/// Data structure with the necessary information to add multiple items in an Eagle Library.
public struct AddManyItems {
    /// The array object made up of multiple items.
    var items: [EagleRouteV1.Item.Add.ItemType]
    /// If the parameter is defined, images will be added to the corresponding folder.
    var folderID: EagleFolder.ID?
}

// MARK: Self: Codable
extension AddManyItems: Codable {}

// MARK: Self: Equatable
extension AddManyItems: Equatable {}

// MARK: Self: Sendable
extension AddManyItems: Sendable {}
