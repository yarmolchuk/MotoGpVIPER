//
//  TeamsInteractor.swift
//  SwiftTestProject
//
//  Created Dima Yarmolchuk on 2/12/18.
//  Copyright © 2018 Dima Yarmolchuk. All rights reserved.
//

import Foundation

// MARK: - Output

protocol TeamsInteractorOutput: class {
    func handle(error: Error)
    func handleDidLoad(teams: [Team])
}

// MARK: - Protocol

protocol TeamsInteractor: class {
    var output: TeamsInteractorOutput? { get set }
    
    func loadTeams()
    func ridersInteractor() -> RidersInteractor?
    func teamRidersInteractor(team: Team) -> RidersInteractor?
}

// MARK: - Implementation

private final class TeamsInteractorImpl: TeamsInteractor {
    weak var output: TeamsInteractorOutput?
    
    private let teamsService: TeamsService
    private var teams: [Team] = []
    
    init(teamsService: TeamsService) {
        self.teamsService = teamsService
    }
    
    func loadTeams() {
        teamsService.teams { [weak self] (teams, error) in
            if let _error = error {
                self?.output?.handle(error: _error)
            } else if let _teams = teams {
                self?.teams = _teams
                self?.output?.handleDidLoad(teams: _teams)
            }
        }
    }
    
    func ridersInteractor() -> RidersInteractor? {
        return RidersInteractorFactory.default()
    }
    
    func teamRidersInteractor(team: Team) -> RidersInteractor? {
        if let selectedTeam = teams.first(where: {$0.uid == team.uid}) {
            return RidersInteractorFactory.teamRiaders(team: selectedTeam)
        } else {
            return nil
        }
    }
}

// MARK: - Factory

final class TeamsInteractorFactory {
    static func `default`(teamsService: TeamsService = TeamsServiceFactory.default()) -> TeamsInteractor {
        return TeamsInteractorImpl(teamsService: teamsService)
    }
}
