//
//  RidersService.swift
//  SwiftTestProject
//
//  Created by Dima Yarmolchuk on 2/4/18.
//  Copyright © 2018 Dima Yarmolchuk. All rights reserved.
//

import Foundation

// MARK: Protocol

protocol RidersService {

}

// MARK: Implementation

private final class RidersServiceImpl: RidersService {

}

// MARK: Factory

final class RidersServiceFactory {
    static func `default`() -> RidersService {
        return RidersServiceImpl()
    }
}
