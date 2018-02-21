//
//  AmazonApiToken.swift
//  SwiftTestProject
//
//  Created by Dima Yarmolchuk on 2/4/18.
//  Copyright © 2018 Dima Yarmolchuk. All rights reserved.
//

import Foundation

enum AmazonApiToken {
    case getRiders
    case getTeams
}

extension AmazonApiToken: TargetType {
    var baseUrl: String {
        return "https://s3.eu-west-2.amazonaws.com/"
    }
    var parameters: [String : Any] {
        return [:]
    }
    var path: String {
        switch self {
        case .getRiders:
            return "motogpriders/riders.json?versionid=PwtHz5pl5CbkU.W.OhqBmNGOrjrT7X9f"
        case .getTeams:
            return "motogpriders/teams.json"
        }
    }
    var method: Method {
        return .get
    }
    var encoding: Encoding {
        return .json
    }
    var headers: [String : String] {
        return [:]
    }
}
