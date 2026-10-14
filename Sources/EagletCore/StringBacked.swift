//
//  ValueBacked.swift
//  Eaglet
//
//  Created by Martônio Júnior on 08/10/2026.
//

public struct StringBacked<Value: EagleAPI.StringRepresentable> {
    public var value: Value

    public init(_ value: Value) {
        self.value = value
    }
}

// MARK: Self: Decodable
extension StringBacked: Decodable {
    // swiftlint:disable:next missing_docs
    public init(from decoder: any Decoder) throws {
        let container = try decoder.singleValueContainer()
        let string = try container.decode(String.self)

        guard let value = Value(string) else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: """
                Failed to convert an instance of \(Value.self) from "\(string)"
                """
            )
        }

        self.value = value
    }
}

// MARK: Self: Encodable
extension StringBacked: Encodable {
    // swiftlint:disable:next missing_docs
    public func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value.description)
    }
}

// MARK: Self: Equatable
extension StringBacked: Equatable where Value: Equatable {}

// MARK: Self: Hashable
extension StringBacked: Hashable where Value: Hashable {}

// MARK: Self: Sendable
extension StringBacked: Sendable where Value: Sendable {}
