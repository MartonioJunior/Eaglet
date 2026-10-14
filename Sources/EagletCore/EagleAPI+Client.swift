//
//  EagleAPI+Client.swift
//  Eaglet
//
//  Created by Martônio Júnior on 07/10/2026.
//

public import APIUtils

public extension EagleAPI {
    protocol Client {
        associatedtype Route

        static var live: EntryPoint { get }
    }
}
