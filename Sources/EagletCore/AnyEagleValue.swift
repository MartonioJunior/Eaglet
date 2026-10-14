//
//  AnyEagleValue.swift
//  Eaglet
//
//  Created by Martônio Júnior on 11/10/2026.
//

/// Source: https://stackoverflow.com/questions/48297263/how-to-use-any-in-codable-type
public struct AnyEagleValue {
    var value: Any

    public init(value: Any) {
        self.value = value
    }
}

// MARK: Self: Decodable
extension AnyEagleValue: Decodable {
    struct CodingKeys: CodingKey {
        var stringValue: String
        var intValue: Int?

        init?(intValue: Int) {
            self.stringValue = "\(intValue)"
            self.intValue = intValue
        }

        init?(stringValue: String) { self.stringValue = stringValue }
    }

    public init(from decoder: any Decoder) throws {
        if let container = try? decoder.container(keyedBy: CodingKeys.self) {
            var result = [String: Any]()

            try container.allKeys.forEach { (key) throws in
                result[key.stringValue] = try container.decode(AnyEagleValue.self, forKey: key).value
            }

            value = result
        } else if var container = try? decoder.unkeyedContainer() {
            var result = [Any]()

            while !container.isAtEnd {
                result.append(try container.decode(AnyEagleValue.self).value)
            }

            value = result
        } else if let container = try? decoder.singleValueContainer() {
            if let intVal = try? container.decode(Int.self) {
                value = intVal
            } else if let doubleVal = try? container.decode(Double.self) {
                value = doubleVal
            } else if let boolVal = try? container.decode(Bool.self) {
                value = boolVal
            } else if let stringVal = try? container.decode(String.self) {
                value = stringVal
            } else {
                throw DecodingError.dataCorruptedError(in: container, debugDescription: "the container contains nothing serialisable")
            }
        } else {
            throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Could not serialise"))
        }
    }
}

// MARK: Self: Encodable
extension AnyEagleValue: Encodable {
    public func encode(to encoder: Encoder) throws {
        if let array = value as? [Any] {
            var container = encoder.unkeyedContainer()
            for value in array {
                let decodable = AnyEagleValue(value: value)
                try container.encode(decodable)
            }
        } else if let dictionary = value as? [String: Any] {
            var container = encoder.container(keyedBy: CodingKeys.self)
            for (key, value) in dictionary {
                let codingKey = CodingKeys(stringValue: key)!
                let decodable = AnyEagleValue(value: value)
                try container.encode(decodable, forKey: codingKey)
            }
        } else {
            var container = encoder.singleValueContainer()
            if let intVal = value as? Int {
                try container.encode(intVal)
            } else if let doubleVal = value as? Double {
                try container.encode(doubleVal)
            } else if let boolVal = value as? Bool {
                try container.encode(boolVal)
            } else if let stringVal = value as? String {
                try container.encode(stringVal)
            } else {
                throw EncodingError.invalidValue(value, EncodingError.Context.init(codingPath: [], debugDescription: "The value is not encodable"))
            }
        }
    }
}

// MARK: Self: Equatable
extension AnyEagleValue: Equatable {
    public static func == (lhs: Self, rhs: Self) -> Bool {
        guard let a = lhs as? AnyHashable,
            let b = rhs as? AnyHashable else { return false }

        return a == b
    }
}

// MARK: Self: ExpressibleByArrayLiteral
extension AnyEagleValue: ExpressibleByArrayLiteral {
    public init(arrayLiteral elements: Any...) {
        self.value = elements
    }
}

// MARK: Self: ExpressibleByBooleanLiteral
extension AnyEagleValue: ExpressibleByBooleanLiteral {
    public init(booleanLiteral value: Bool) {
        self.value = value
    }
}

// MARK: Self: ExpressibleByDictionaryLiteral
extension AnyEagleValue: ExpressibleByDictionaryLiteral {
    public typealias Key = AnyHashable
    public typealias Value = Any

    public init(dictionaryLiteral elements: (AnyHashable, Value)...) {
        self.value = elements
    }
}

// MARK: Self: ExpressibleByFloatLiteral
extension AnyEagleValue: ExpressibleByFloatLiteral {
    public init(floatLiteral value: Double) {
        self.value = value
    }
}

// MARK: Self: ExpressibleByIntegerLiteral
extension AnyEagleValue: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: Double) {
        self.value = value
    }
}

// MARK: Self: ExpressibleByStringLiteral
extension AnyEagleValue: ExpressibleByStringLiteral {
    public init(stringLiteral value: String) {
        self.value = value
    }
}
