//
//  EagleRouteV1+Folder+Tests.swift
//  Eaglet
//
//  Created by Martônio Júnior on 09/10/2026.
//

import CustomDump
@testable import Eaglet1
import Foundation
import Testing
import URLRouting

struct EagleRouteV1FolderTests {
    @Test("Creates a new folder", arguments: [
        (
            CreateFolder(named: "Lollipop"),
            CreateFolder.Output(
                id: "KBJJSMMVF9WYL",
                name: "Lollipop",
                images: [],
                folders: [],
                modificationTime: 1592409993367,
                imagesMappings: [:],
                tags: [],
                children: [],
                isExpand: true
            )
        )
    ])
    func createFolder(_ draft: CreateFolder, expected: CreateFolder.Output) async throws {
        let client: URLRoutingClient<EagleRouteV1> = .failing.override {
            guard case .folder(.create) = $0 else { return false }
            return true
        } with: {
            try .ok(
                CreateFolder.Output(
                    id: expected.id,
                    name: draft.folderName,
                    images: [],
                    folders: [],
                    modificationTime: expected.modificationTime,
                    imagesMappings: [:],
                    tags: [],
                    children: [],
                    isExpand: true
                )
            )
        }

        let result = try await client.createFolder(draft)
        expectNoDifference(result, expected)
    }

    @Test("Obtains a list of folders", arguments: [
        ([
            EagleFolder.ListItem(
                id: "KBJJSMMVF9WYL",
                name: "First Folder",
                description: "Cool Description",
                children: [],
                modificationTime: 1592409993367,
                tags: [],
                extendTags: [],
                icon: "grid",
                iconColor: "red",
                pinyin: "First Folder",
                password: "",
                passwordTips: ""
            ),
            EagleFolder.ListItem(
                id: "KBJJKMMVF7WYL",
                name: "Second Folder",
                description: "Boring Description",
                children: [],
                modificationTime: 1592405693367,
                tags: [],
                extendTags: [],
                icon: "plane",
                iconColor: "yellow",
                pinyin: "Second Folder",
                password: "1234",
                passwordTips: "Simple password"
            )
        ])
    ])
    func getAllFolders(expected: [EagleFolder.ListItem]) async throws {
        let client: URLRoutingClient<EagleRouteV1> = .failing.override(.folder(.list(.all))) {
            try .ok(expected)
        }

        let result = try await client.getAllFolders()

        expectNoDifference(result, expected)
    }

    @Test("Obtains a list of recently used folders", arguments: [
        ([
            EagleFolder.RecentItem(
                id: "KBJJSMMVF9WYL",
                name: "First Folder",
                images: [],
                folders: [],
                modificationTime: 1592409993367,
                editable: true,
                imagesMappings: [:],
                tags: [],
                children: [],
                isExpand: true,
                parent: "",
                icon: "grid",
                iconColor: "red",
                size: 27,
                vstype: "folder",
                guidelines: ["red"],
                styles: .init(depth: 1, first: false, last: true),
                isVisible: true,
                index: 12,
                hashKey: "object:15752",
                newFolderName: "First Folder",
                imageCount: 1,
                depth: 1,
                descendantImageCount: 1,
                pinyin: "First Folder",
                extendTags: [],
                covers: ["cover-image"]
            ),
            EagleFolder.RecentItem(
                id: "KBJJSMMVF9WYL",
                name: "First Folder",
                images: [],
                folders: [],
                modificationTime: 1592405693367,
                editable: false,
                imagesMappings: [:],
                tags: [],
                children: [],
                isExpand: false,
                parent: "",
                icon: "plane",
                iconColor: "yellow",
                size: 27,
                vstype: "folder",
                guidelines: ["red"],
                styles: .init(depth: 1, first: false, last: true),
                isVisible: true,
                index: 12,
                hashKey: "object:378",
                newFolderName: "Second Folder",
                imageCount: 1,
                depth: 1,
                descendantImageCount: 1,
                pinyin: "Second Folder",
                extendTags: [],
                covers: ["another-image"]
            )
        ])
    ])
    func getRecentlyUsedFolders(expected: [EagleFolder.RecentItem]) async throws {
        let client: URLRoutingClient<EagleRouteV1> = .failing.override(.folder(.list(.recentlyUsed))) {
            try .ok(expected)
        }

        let result = try await client.getRecentlyUsedFolders()

        expectNoDifference(result, expected)
    }

    @Test("Renames a folder", arguments: [
        (
            RenameFolder(id: "KBJJSMMVF9WYL", newName: "Lollipop"),
            RenameFolder.Output(
                id: "KBJJSMMVF9WYL",
                name: "One name",
                images: [],
                folders: [],
                modificationTime: 1592409993367,
                imagesMappings: [:],
                tags: [],
                children: [],
                isExpand: true,
                size: 47,
                vstype: "folder",
                styles: .init(depth: 0, first: false, last: false),
                isVisible: true,
                hashKey: "object:765",
                newFolderName: "Lollipop",
                editable: false,
                pinyin: "One name"
            )
        )
    ])
    func renameFolder(_ rename: RenameFolder, expected: RenameFolder.Output) async throws {
        let client: URLRoutingClient<EagleRouteV1> = .failing.override {
            guard case .folder(.rename) = $0 else { return false }
            return true
        } with: {
            try .ok(
                RenameFolder.Output(
                    id: rename.id,
                    name: expected.name,
                    images: expected.images,
                    folders: expected.folders,
                    modificationTime: expected.modificationTime,
                    imagesMappings: expected.imagesMappings,
                    tags: expected.tags,
                    children: expected.children,
                    isExpand: expected.isExpand,
                    size: expected.size,
                    vstype: expected.vstype,
                    styles: expected.styles,
                    isVisible: expected.isVisible,
                    hashKey: expected.hashKey,
                    newFolderName: rename.newName,
                    editable: expected.editable,
                    pinyin: expected.name
                )
            )
        }

        let result = try await client.renameFolder(rename)
        expectNoDifference(result, expected)
    }

    @Test("Updates a folder's information", arguments: [
        (
            UpdateFolder(
                id: "KBJJSMMVF9WYL",
                newName: "Lollipop",
                newDescription: "Wow!",
                newColor: "orange"
            ),
            UpdateFolder.Output(
                id: "KBJJSMMVF9WYL",
                name: "Lollipop",
                description: "Wow!",
                images: [],
                folders: [],
                modificationTime: 1592409993367,
                imagesMappings: [:],
                tags: [],
                children: [],
                isExpand: true,
                size: 47,
                vstype: "folder",
                styles: .init(depth: 0, first: false, last: false),
                isVisible: true,
                hashKey: "object:765",
                editable: false
            )
        ),
        (
            UpdateFolder(
                id: "KBJJSMMVF9WYL",
                newDescription: "Wow!",
                newColor: "orange"
            ),
            UpdateFolder.Output(
                id: "KBJJSMMVF9WYL",
                name: "Apple",
                description: "Wow!",
                images: [],
                folders: [],
                modificationTime: 1592409993367,
                imagesMappings: [:],
                tags: [],
                children: [],
                isExpand: true,
                size: 47,
                vstype: "folder",
                styles: .init(depth: 0, first: false, last: false),
                isVisible: true,
                hashKey: "object:765",
                editable: false
            )
        ),
        (
            UpdateFolder(
                id: "KBJJSMMVF9WYL",
                newName: "Lollipop",
                newColor: "orange"
            ),
            UpdateFolder.Output(
                id: "KBJJSMMVF9WYL",
                name: "Lollipop",
                description: "Wait...",
                images: [],
                folders: [],
                modificationTime: 1592409993367,
                imagesMappings: [:],
                tags: [],
                children: [],
                isExpand: true,
                size: 47,
                vstype: "folder",
                styles: .init(depth: 0, first: false, last: false),
                isVisible: true,
                hashKey: "object:765",
                editable: false
            )
        ),
        (
            UpdateFolder(
                id: "KBJJSMMVF9WYL",
                newName: "Lollipop",
                newDescription: "Wow!",
            ),
            UpdateFolder.Output(
                id: "KBJJSMMVF9WYL",
                name: "Lollipop",
                description: "Wow!",
                images: [],
                folders: [],
                modificationTime: 1592409993367,
                imagesMappings: [:],
                tags: [],
                children: [],
                isExpand: true,
                size: 47,
                vstype: "folder",
                styles: .init(depth: 0, first: false, last: false),
                isVisible: true,
                hashKey: "object:765",
                editable: false
            )
        )
    ])
    func updateFolder(_ update: UpdateFolder, expected: UpdateFolder.Output) async throws {
        let client: URLRoutingClient<EagleRouteV1> = .failing.override {
            guard case .folder(.update) = $0 else { return false }
            return true
        } with: {
            try .ok(
                UpdateFolder.Output(
                    id: update.id,
                    name: update.newName ?? expected.name,
                    description: update.newDescription ?? expected.description,
                    images: expected.images,
                    folders: expected.folders,
                    modificationTime: expected.modificationTime,
                    imagesMappings: expected.imagesMappings,
                    tags: expected.tags,
                    children: expected.children,
                    isExpand: expected.isExpand,
                    size: expected.size,
                    vstype: expected.vstype,
                    styles: expected.styles,
                    isVisible: expected.isVisible,
                    hashKey: expected.hashKey,
                    editable: expected.editable,
                )
            )
        }

        let result = try await client.updateFolder(update)
        expectNoDifference(result, expected)
    }
}
