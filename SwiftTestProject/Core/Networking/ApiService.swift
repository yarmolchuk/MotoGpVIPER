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
    func request(with toket:TargetType, completion: @escaping(ApiResponce) -> Void)
}

// MARK: Implementation

private final class ApiServiceImpl: ApiService {
    func request(with toket: TargetType, completion: @escaping (ApiResponce) -> Void) {
        let url = URL(string: toket.baseUrl + toket.path)
        let urlSession = URLSession.shared
        
        urlSession.dataTask(with: url!) { (data, response, error) in
            switch (data, response, error) {
            case (let data, let response as HTTPURLResponse, nil) where response.statusCode == 200:
                guard let _data = data else { fallthrough }
                completion(ApiResponce.success(_data))

            default:
                guard let _error = error else { break }
                completion(ApiResponce.failure(_error))
            }
        }.resume()
    }
}

// MARK: Factory

class ApiServiceFactory {
    static func `default`() -> ApiService {
        return ApiServiceImpl()
    }
}
