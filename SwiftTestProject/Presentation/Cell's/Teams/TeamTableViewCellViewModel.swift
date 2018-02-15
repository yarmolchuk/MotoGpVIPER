//
//  TeamTableViewCellViewModel.swift
//  SwiftTestProject
//
//  Created by Dima Yarmolchuk on 2/12/18.
//Copyright © 2018 Dima Yarmolchuk. All rights reserved.
//

import Foundation

// MARK: Protocol

protocol TeamTableViewCellViewModel {
    var name: String {get}
    var uid: String {get}
}

// MARK: Implementation

private class TeamTableViewCellViewModelImpl: TeamTableViewCellViewModel {
    let name: String
    let uid: String
    
    init(name: String, uid: String) {
        self.name = name
        self.uid = uid
    }
}

// MARK: Factory

class TeamTableViewCellViewModelFactory {
    static func `default`(name: String, uid: String) -> TeamTableViewCellViewModel {
        return TeamTableViewCellViewModelImpl(name: name, uid: uid)
    }
}

