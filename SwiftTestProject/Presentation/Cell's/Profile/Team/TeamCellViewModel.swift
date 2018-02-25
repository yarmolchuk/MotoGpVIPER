//
//  TeamCellViewModel.swift
//  SwiftTestProject
//
//  Created by Dima Yarmolchuk on 2/25/18.
//Copyright © 2018 Dima Yarmolchuk. All rights reserved.
//

import Foundation

// MARK: Protocol

protocol TeamCellViewModel {
    var team: String { get }
}

// MARK: Implementation

private class TeamCellViewModelImpl: TeamCellViewModel {
    let team: String
    
    init(team: String) {
        self.team = team
    }
}

// MARK: Factory

class TeamCellViewModelFactory {
    static func `default`(team: String) -> TeamCellViewModel {
        return TeamCellViewModelImpl(team: team)
    }
}

