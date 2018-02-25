//
//  Profile.swift
//  SwiftTestProject
//
//  Created by Dima Yarmolchuk on 2/21/18.
//  Copyright © 2018 Dima Yarmolchuk. All rights reserved.
//

import Foundation

final class Profile {
    let name: String
    var team: String
    var bike: String
    var placeOfBirth: String
    var dateOfBirth: String
    var weight: String
    var height: String
    var photoUrl: String
    var profile: String
    
    init(name: String, team: String, bike: String, placeOfBirth: String, dateOfBirth: String,
         weight: String, height: String, photoUrl: String, profile: String) {
        
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

