//
//  BikeCellViewModel.swift
//  SwiftTestProject
//
//  Created by Dima Yarmolchuk on 2/23/18.
//Copyright © 2018 Dima Yarmolchuk. All rights reserved.
//

import Foundation

// MARK: Protocol

protocol BikeCellViewModel {
    var bike: String { get }
}

// MARK: Implementation

private class BikeCellViewModelImpl: BikeCellViewModel {
    let bike: String
    
    init(bike: String) {
        self.bike = bike
    }
}

// MARK: Factory

class BikeCellViewModelFactory {
    static func `default`(bike: String) -> BikeCellViewModel {
        return BikeCellViewModelImpl(bike: bike)
    }
}

