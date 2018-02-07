//
//  Encoding.swift
//  SwiftTestProject
//
//  Created by Dima Yarmolchuk on 2/6/18.
//  Copyright © 2018 Dima Yarmolchuk. All rights reserved.
//

import Foundation

// MARK: Protocol

protocol Encoding {

}

// MARK: Implementation

private final class EncodingImpl: Encoding {

}

// MARK: Factory

final class EncodingFactory {
    static func `default`() -> Encoding {
        return EncodingImpl()
    }
}
