//
//  ApiService.swift
//  SwiftTestProject
//
//  Created by Dima Yarmolchuk on 2/4/18.
//  Copyright © 2018 Dima Yarmolchuk. All rights reserved.
//

import Foundation

// MARK: Protocol

protocol ApiService {
    func request(with toket:TargetType, complection: @escaping(ApiResponce) -> Void )
}

// MARK: Implementation

private final class ApiServiceImpl: ApiService {
    func request(with toket: TargetType, complection: @escaping (ApiResponce) -> Void) {
    }
}

