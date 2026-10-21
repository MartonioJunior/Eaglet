//
//  Encodable+JSON.swift
//  Eaglet
//
//  Created by Martônio Júnior on 20/10/2026.
//

// Source - https://stackoverflow.com/a/62164869
// Posted by ScottyBlades, modified by community. See post 'Timeline' for change history
// Retrieved 2026-10-20, License - CC BY-SA 4.0
extension Encodable {
    var stringified: String? {
        guard let data = try? JSONEncoder.stringify.encode(self) else { return nil }
        return String(data: data, encoding: .utf8)
    }
}

// MARK: JSONEncoder (EX)
public import Foundation

public extension JSONEncoder {
    static var stringify: JSONEncoder {
        var encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        return encoder
    }
}
