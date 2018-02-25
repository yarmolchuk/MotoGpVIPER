//
//  DetailInfoRiderViewModel.swift
//  SwiftTestProject
//
//  Created by Dima Yarmolchuk on 2/11/18.
//  Copyright © 2018 Dima Yarmolchuk. All rights reserved.
//

import Foundation

// MARK: Protocol

protocol ProfileRiderViewModel {
    var name: String { get }
    var team: String { get }
    var bike: String { get }
    var placeOfBirth: String { get}
    var dateOfBirth: String { get}
    var weight: String { get }
    var height: String { get }
    var photoUrl: String { get }
    var profile: String { get }
}

// MARK: Implementation

private final class ProfileRiderViewModelImpl: ProfileRiderViewModel {
    
    var name: String
    var team: String
    var bike: String
    var placeOfBirth: String
    var dateOfBirth: String
    var weight: String
    var height: String
    var photoUrl: String
    var profile: String
    
    init(name: String, team: String, bike: String, placeOfBirth: String, dateOfBirth: String, weight: String, height: String, photoUrl: String, profile: String) {
        self.name = name
        self.team = team
        self.bike = bike
        self.placeOfBirth = placeOfBirth
        self.dateOfBirth = dateOfBirth
        self.weight = weight
        self.height = height
        self.photoUrl = photoUrl
        self.profile = profile
    }
}

// MARK: Factory

final class ProfileRiderViewModelFactory {
    static func `default`(profile: Profile) -> ProfileRiderViewModel {
        return ProfileRiderViewModelImpl(name: profile.name, team: profile.team, bike: profile.bike, placeOfBirth: profile.placeOfBirth,
                                         dateOfBirth: profile.dateOfBirth, weight: profile.weight, height: profile.height,
                                         photoUrl: profile.photoUrl, profile: profile.profile)
    }
}
