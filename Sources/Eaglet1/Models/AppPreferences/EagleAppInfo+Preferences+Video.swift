//
//  EagleAppInfo+Preferences+Video.swift
//  Eaglet
//
//  Created by Martônio Júnior on 08/10/2026.
//

public import Common

public extension EagleAppInfo.Preferences {
    struct Video: Codable, Equatable, Sendable {
        public var hoverPlay: StringBacked<Bool>
        public var zoomFill: StringBacked<Bool>
        public var autoPlay: StringBacked<Bool>
        public var rememberPosition: StringBacked<Bool>
        public var loopShortVideo: StringBacked<Bool>

        public init(
            hoverPlay: Bool,
            zoomFill: Bool,
            autoPlay: Bool,
            rememberPosition: Bool,
            loopShortVideo: Bool
        ) {
            self.hoverPlay = StringBacked(hoverPlay)
            self.zoomFill = StringBacked(zoomFill)
            self.autoPlay = StringBacked(autoPlay)
            self.rememberPosition = StringBacked(rememberPosition)
            self.loopShortVideo = StringBacked(loopShortVideo)
        }
    }
}
