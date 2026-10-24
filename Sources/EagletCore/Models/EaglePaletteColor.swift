//
//  EaglePaletteColor.swift
//  Eaglet
//
//  Created by Martônio Júnior on 22/10/2026.
//

/// Color in the palette of an Eagle item.
public struct EaglePaletteColor {
    /// Color components.
    var color: [UInt8]
    /// Weight of the color in relation to the overall thumbnail.
    var ratio: Double
    var hashKey: String?

    public init(
        color: [UInt8],
        ratio: Double,
        hashKey: String? = nil
    ) {
        self.color = color
        self.ratio = ratio
        self.hashKey = hashKey
    }
}

// MARK: Self: Codable
extension EaglePaletteColor: Codable {
    enum CodingKeys: String, CodingKey {
        case color // swiftlint:disable:this explicit_enum_raw_value
        case ratio // swiftlint:disable:this explicit_enum_raw_value
        case hashKey = "$$hashKey"
    }
}

// MARK: Self: Equatable
extension EaglePaletteColor: Equatable {}

// MARK: Self: Sendable
extension EaglePaletteColor: Sendable {}
