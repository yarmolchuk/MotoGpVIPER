//
//  TeamMapper.swift
//  SwiftTestProject
//
//  Created by Dima Yarmolchuk on 2/12/18.
//  Copyright © 2018 Dima Yarmolchuk. All rights reserved.
//

import Foundation
import SwiftyJSON

// MARK: Protocol

protocol TeamMapper {
    func map(_ data: Data) -> [Team]?
}

// MARK: Implementation

private final class TeamMapperImpl: TeamMapper {
    func map(_ data: Data) -> [Team]? {
        let json = try! JSON(data: data)
        return json["items"].arrayValue.map({
            Team(uid: $0["uid"].stringValue, name: $0["name"].stringValue)
        })
    }
}

// MARK: Factory

final class TeamMapperFactory {
    static func `default`() -> TeamMapper {
        return TeamMapperImpl()
    }
}
