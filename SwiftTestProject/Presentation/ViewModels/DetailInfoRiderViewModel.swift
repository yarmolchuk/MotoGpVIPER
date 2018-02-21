//
//  DetailInfoRiderViewModel.swift
//  SwiftTestProject
//
//  Created by Dima Yarmolchuk on 2/11/18.
//  Copyright © 2018 Dima Yarmolchuk. All rights reserved.
//

import Foundation

// MARK: Protocol

protocol DetailInfoRiderViewModel {
    var name: String {get}
}

// MARK: Implementation

private final class DetailInfoRiderViewModelImpl: DetailInfoRiderViewModel {
    
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

// MARK: Factory

final class DetailInfoRiderViewModelFactory {
    static func `default`(rider: Rider) -> DetailInfoRiderViewModel {
        return DetailInfoRiderViewModelImpl(name: rider.name)
    }
}
