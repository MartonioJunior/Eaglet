//
//  EagleAPIRoute+Application.swift
//  SwiftKnowledge
//
//  Created by Martônio Júnior on 14/04/25.
//

public import CasePaths

public extension EagleRouteV1 {
    @CasePathable
    enum Application {
        case info
    }
}

// MARK: Self: Sendable
extension EagleRouteV1.Application: Sendable {}
