//
//  Rider.swift
//  SwiftTestProject
//
//  Created by Dima Yarmolchuk on 2/7/18.
//  Copyright © 2018 Dima Yarmolchuk. All rights reserved.
//

import Foundation

final class Rider {
    let uid: String
    let teamUid: String
    
    let name: String
    let team: String
    let number: String
    let bike: String
    let placeOfBirth: String
    let dateOfBirth: String
    let weight: String
    let height: String
    let photoUrl: String
    
    init(uid: String, name: String, number:String, team: String, bike: String, placeOfBirth: String, dateOfBirth: String,
         weight: String, height: String, photoUrl: String, teamUid: String) {
    
        self.uid = uid
        self.teamUid = teamUid
        
        self.name = name
        self.number = number
        self.team = team
        self.bike = bike
        self.placeOfBirth = placeOfBirth
        self.dateOfBirth = dateOfBirth
        self.weight = weight
        self.height = height
        self.photoUrl = photoUrl
    }
}
