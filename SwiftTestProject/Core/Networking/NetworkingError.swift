//
//  NetworkingError.swift
//  SwiftTestProject
//
//  Created by Dima Yarmolchuk on 2/6/18.
//  Copyright © 2018 Dima Yarmolchuk. All rights reserved.
//

import Foundation

// MARK: Protocol

protocol NetworkingError {

}

// MARK: Implementation

private final class NetworkingErrorImpl: NetworkingError {

}

// MARK: Factory

final class NetworkingErrorFactory {
    static func `default`() -> NetworkingError {
        return NetworkingErrorImpl()
    }
}
