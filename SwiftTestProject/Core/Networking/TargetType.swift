//
//  TargetType.swift
//  SwiftTestProject
//
//  Created by Dima Yarmolchuk on 2/6/18.
//  Copyright © 2018 Dima Yarmolchuk. All rights reserved.
//

import Foundation

// MARK: Protocol

protocol TargetType {
    var baseUrl: String { get }
    var parameters: [String: Any] { get }
    var path: String { get }
    var method: Method { get }
    var encoding: Encoding { get }
    var headers: [String: String] { get }
}
