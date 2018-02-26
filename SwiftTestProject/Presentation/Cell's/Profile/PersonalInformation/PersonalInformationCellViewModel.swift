//
//  PersonalInformationCellViewModel.swift
//  SwiftTestProject
//
//  Created by Dima Yarmolchuk on 2/23/18.
//Copyright © 2018 Dima Yarmolchuk. All rights reserved.
//

import Foundation

// MARK: Protocol

protocol PersonalInformationCellViewModel {
    var weight: String { get }
    var height: String { get }
}

// MARK: Implementation

private class PersonalInformationCellViewModelImpl: PersonalInformationCellViewModel {
    let weight: String
    let height: String
    
    init(weight: String, height: String) {
        self.weight = weight
        self.height = height
    }
}

// MARK: Factory

class PersonalInformationCellViewModelFactory {
    static func `default`(weight: String, height: String) -> PersonalInformationCellViewModel {
        return PersonalInformationCellViewModelImpl(weight: weight, height: height)
    }
}

