//
//  EagleAPI+StringRepresentable.swift
//  Eaglet
//
//  Created by Martônio Júnior on 08/10/2026.
//

public extension EagleAPI {
    protocol StringRepresentable: CustomStringConvertible {
        init?(_ string: String)
    }
}

// MARK: Bool (EX)
extension Bool: EagleAPI.StringRepresentable {}

// MARK: Int (EX)
extension Int: EagleAPI.StringRepresentable {}
