//
//  AddMany.swift
//  SwiftKnowledge
//
//  Created by Martônio Júnior on 14/04/25.
//

public struct AddManyItems {
    var items: [EagleRouteV1.Item.Add.ItemType]
    var folderID: EagleFolder.ID?
}

// MARK: Self: Codable
extension AddManyItems: Codable {}

// MARK: Self: Equatable
extension AddManyItems: Equatable {}

// MARK: Self: Sendable
extension AddManyItems: Sendable {}
