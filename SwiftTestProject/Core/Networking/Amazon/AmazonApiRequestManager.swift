//
//  AmazonApiRequestManager.swift
//  SwiftTestProject
//
//  Created by Dima Yarmolchuk on 2/4/18.
//  Copyright © 2018 Dima Yarmolchuk. All rights reserved.
//

import Foundation

// MARK: Protocol

protocol AmazonApiRequestManager {

}

// MARK: Implementation

private final class AmazonApiRequestManagerImpl: AmazonApiRequestManager {

}

// MARK: Factory

final class AmazonApiRequestManagerFactory {
    static func `default`() -> AmazonApiRequestManager {
        return AmazonApiRequestManagerImpl()
    }
}
