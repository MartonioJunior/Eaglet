//
//  EagleAPIRoute+Application.swift
//  SwiftKnowledge
//
//  Created by Martônio Júnior on 14/04/25.
//

public import CasePaths

public extension EagleAPIRoute {
    @CasePathable
    enum Application {
        case info
    }
}

// MARK: Self: Sendable
extension EagleAPIRoute.Application: Sendable {}
