//
//  AnyParserPrinter+Utilities.swift
//  Eaglet
//
//  Created by Martônio Júnior on 21/10/2026.
//

public import Parsing

public extension AnyParserPrinter
where Input == Substring, Output == [String] {
    static func listParser(separator: Character = ",") -> Self {
        Many(1...) {
            Prefix { $0 != separator }.map(.string)
        } separator: {
            separator.utf8
        } terminator: {
            End()
        }.eraseToAnyParserPrinter()
    }
}
