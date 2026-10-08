//
//  EagleAppInfo+Preferences+Habits.swift
//  Eaglet
//
//  Created by Martônio Júnior on 08/10/2026.
//

public extension EagleAppInfo.Preferences {
    struct Habits: Codable, Equatable, Sendable {
        public var dblclickSidebarItem: String
        public var scrollBehavior: String
        public var videoScrollBehavior: String
        public var hoverZoom: String
        public var scrollBehaviorTour: Bool
        public var renderBehavior: String
        public var defaultMode: String
        public var rememberLastZoom: String
        public var defaultRatio: String
        public var transparency: String
        public var keyspace: String
        public var middleBtn: String
        public var doubleclick: String
        public var gifViewer: String
        public var alwaysPlayGIF: String
        public var alwaysShowAnnotations: String
    }
}
