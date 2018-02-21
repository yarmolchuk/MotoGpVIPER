//
//  RiderTableViewCellViewModel.swift
//  SwiftTestProject
//
//  Created by Dima Yarmolchuk on 2/7/18.
//  Copyright © 2018 Dima Yarmolchuk. All rights reserved.
//

import Foundation

// MARK: Protocol

protocol TableViewCellViewModel {
}

protocol RiderTableViewCellViewModel:  TableViewCellViewModel {
    var uid: String {get}
    var name: String {get}
    var number: String {get}
    var urlPhoto: String {get}
}

// MARK: Implementation

private class RiderTableViewCellViewModelImpl: RiderTableViewCellViewModel {
    let uid: String
    let name: String
    let number: String
    let urlPhoto: String
    
    init(name: String, number: String, urlPhoto: String, uid: String) {
        self.uid = uid
        self.name = name
        self.number = number
        self.urlPhoto = urlPhoto
    }
}

// MARK: Factory

class RiderTableViewCellViewModelFactory {
    static func `default`(name: String, number: String, urlPhoto: String, uid: String) -> RiderTableViewCellViewModel {
        return RiderTableViewCellViewModelImpl(name: name, number: number, urlPhoto: urlPhoto, uid: uid)
    }
}

