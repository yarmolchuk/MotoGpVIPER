//
//  InfoCellViewModel.swift
//  SwiftTestProject
//
//  Created by Dima Yarmolchuk on 2/23/18.
//Copyright © 2018 Dima Yarmolchuk. All rights reserved.
//

import Foundation

// MARK: Protocol

protocol InfoCellViewModel {
    var placeOfBirth: String { get }
    var dateOfBirth: String { get }
}

// MARK: Implementation

private class InfoCellViewModelImpl: InfoCellViewModel {
    let placeOfBirth: String
    let dateOfBirth: String
    
    init(placeOfBirth: String, dateOfBirth: String) {
        self.placeOfBirth = placeOfBirth
        self.dateOfBirth = dateOfBirth
    }
}

// MARK: Factory

class InfoCellViewModelFactory {
    static func `default`(placeOfBirth: String, dateOfBirth: String) -> InfoCellViewModel {
        return InfoCellViewModelImpl(placeOfBirth: placeOfBirth, dateOfBirth: dateOfBirth)
    }
}

