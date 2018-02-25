//
//  ProfileMapper.swift
//  SwiftTestProject
//
//  Created by Dima Yarmolchuk on 2/21/18.
//  Copyright © 2018 Dima Yarmolchuk. All rights reserved.
//

import Foundation
import SwiftyJSON

// MARK: Protocol

protocol ProfileMapper {
    func map(_ data: Data) -> Profile
}

// MARK: Implementation

private final class ProfileMapperImpl: ProfileMapper {
    func map(_ data: Data) -> Profile {
        let json = try! JSON(data: data)
        return Profile(name: json["name"].stringValue, team: json["team"].stringValue, bike: json["bike"].stringValue,
                       placeOfBirth: json["placeOfBirth"].stringValue, dateOfBirth: json["dateOfBirth"].stringValue, weight: json["weight"].stringValue,
                       height: json["height"].stringValue, photoUrl: json["photoUrl"].stringValue, profile: json["profile"].stringValue)
    }
}

// MARK: Factory

final class ProfileMapperFactory {
    static func `default`() -> ProfileMapper {
        return ProfileMapperImpl()
    }
}
