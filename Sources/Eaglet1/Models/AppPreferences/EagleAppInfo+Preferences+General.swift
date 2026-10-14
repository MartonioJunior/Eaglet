//
//  EagleAppInfo+Preferences+General.swift
//  Eaglet
//
//  Created by Martônio Júnior on 08/10/2026.
//

public import EagletCore

public extension EagleAppInfo.Preferences {
    struct General: Codable, Equatable, Sendable {
        public var zoom: StringBacked<Int>
        public var language: String
        public var showMenuItem: StringBacked<Bool>
        public var showSidebarBadge: StringBacked<Bool>
        public var autoSelect: StringBacked<Bool>
        public var showCollectModal: StringBacked<Bool>
        public var showCaptureCollectModal: StringBacked<Bool>
        public var IPTC: StringBacked<Bool>
        public var enableGPU: StringBacked<Bool>
        public var enableVibrancy: StringBacked<Bool>

        public init(
            zoom: Int,
            language: String,
            showMenuItem: Bool,
            showSidebarBadge: Bool,
            autoSelect: Bool,
            showCollectModal: Bool,
            showCaptureCollectModal: Bool,
            IPTC: Bool,
            enableGPU: Bool,
            enableVibrancy: Bool
        ) {
            self.zoom = StringBacked(zoom)
            self.language = language
            self.showMenuItem = StringBacked(showMenuItem)
            self.showSidebarBadge = StringBacked(showSidebarBadge)
            self.autoSelect = StringBacked(autoSelect)
            self.showCollectModal = StringBacked(showCollectModal)
            self.showCaptureCollectModal = StringBacked(showCaptureCollectModal)
            self.IPTC = StringBacked(IPTC)
            self.enableGPU = StringBacked(enableGPU)
            self.enableVibrancy = StringBacked(enableVibrancy)
        }
    }
}
