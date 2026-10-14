//
//  EagleAppInfo+Preferences+Filters.swift
//  Eaglet
//
//  Created by Martônio Júnior on 08/10/2026.
//

public import EagletCore

public extension EagleAppInfo.Preferences {
    struct Filters: Codable, Equatable, Sendable {
        public var color: StringBacked<Bool>
        public var tags: StringBacked<Bool>
        public var folders: StringBacked<Bool>
        public var shape: StringBacked<Bool>
        public var rating: StringBacked<Bool>
        public var type: StringBacked<Bool>
        public var date: StringBacked<Bool>
        public var mtime: StringBacked<Bool>
        public var resolution: StringBacked<Bool>
        public var fileSize: StringBacked<Bool>
        public var comments: StringBacked<Bool>
        public var annotation: StringBacked<Bool>
        public var url: StringBacked<Bool>
        public var camera: StringBacked<Bool>
        public var duration: StringBacked<Bool>
        public var bpm: StringBacked<Bool>
        public var fontActivated: StringBacked<Bool>

        public init(
            color: Bool,
            tags: Bool,
            folders: Bool,
            shape: Bool,
            rating: Bool,
            type: Bool,
            date: Bool,
            mtime: Bool,
            resolution: Bool,
            fileSize: Bool,
            comments: Bool,
            annotation: Bool,
            url: Bool,
            camera: Bool,
            duration: Bool,
            bpm: Bool,
            fontActivated: Bool
        ) {
            self.color = StringBacked(color)
            self.tags = StringBacked(tags)
            self.folders = StringBacked(folders)
            self.shape = StringBacked(shape)
            self.rating = StringBacked(rating)
            self.type = StringBacked(type)
            self.date = StringBacked(date)
            self.mtime = StringBacked(mtime)
            self.resolution = StringBacked(resolution)
            self.fileSize = StringBacked(fileSize)
            self.comments = StringBacked(comments)
            self.annotation = StringBacked(annotation)
            self.url = StringBacked(url)
            self.camera = StringBacked(camera)
            self.duration = StringBacked(duration)
            self.bpm = StringBacked(bpm)
            self.fontActivated = StringBacked(fontActivated)
        }
    }
}
