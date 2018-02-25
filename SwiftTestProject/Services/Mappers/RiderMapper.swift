//
//  RiderMapper.swift
//  SwiftTestProject
//
//  Created by Dima Yarmolchuk on 2/7/18.
//  Copyright © 2018 Dima Yarmolchuk. All rights reserved.
//

import Foundation
import SwiftyJSON

// MARK: Protocol

protocol RiderMapper {
    func map(_ data: Data) -> [Rider]?
}

// MARK: Implementation

private final class RiderMapperImpl: RiderMapper {
    func map(_ data: Data) -> [Rider]? {
        let json = try! JSON(data: data)
        return json["items"].arrayValue.map({
             Rider(uid: $0["uid"].stringValue, name: $0["name"].stringValue, team: $0["team"].stringValue, bike: $0["bike"].stringValue,
                   placeOfBirth: $0["placeOfBirth"].stringValue, dateOfBirth: $0["dateOfBirth"].stringValue,
                   weight: $0["weight"].stringValue, height: $0["height"].stringValue, photoUrl: $0["photoUrl"].stringValue,  teamUid: $0["teamUid"].stringValue
        )})
    }
}

// MARK: Factory

final class RiderMapperFactory {
    static func `default`() -> RiderMapper {
        return RiderMapperImpl()
    }
}
