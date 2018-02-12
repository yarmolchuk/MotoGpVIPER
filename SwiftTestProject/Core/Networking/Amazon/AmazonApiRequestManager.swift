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
    func riders(completion: @escaping(ApiResponce) -> Void)
}

// MARK: Implementation

private final class AmazonApiRequestManagerImpl: AmazonApiRequestManager {
    private let apiService: ApiService
    
    init(apiService: ApiService) {
        self.apiService = apiService
    }

    func riders(completion: @escaping(ApiResponce) -> Void) {
        let token = AmazonApiToken.getRiders
        apiService.request(with: token, completion: completion)
    }
}

// MARK: Factory

final class AmazonApiRequestManagerFactory {
    static func `default`(apiService: ApiService = ApiServiceFactory.default()) -> AmazonApiRequestManager {
        return AmazonApiRequestManagerImpl(apiService: apiService)
    }
}
