//
//  ListRidersInteractor.swift
//  SwiftTestProject
//
//  Created Dima Yarmolchuk on 2/4/18.
//  Copyright © 2018 Dima Yarmolchuk. All rights reserved.
//

import Foundation

// MARK: - Output

protocol RidersInteractorOutput: class {
    func handle(error: Error)
    func handleDidLoad(riders: [Rider])
}

// MARK: - Protocol

protocol RidersInteractor: class {
    var output: RidersInteractorOutput? { get set }
    
    func loadRiders()
    func detailedInfoAboutRiderInteractor(riderUid: String) -> DetailedInfoAboutRiderInteractor?
}

// MARK: - Implementation

private final class RidersInteractorImpl: RidersInteractor {
    weak var output: RidersInteractorOutput?
    
    private let ridersService: RidersService
    private var riders: [Rider] = []
    
    init(ridersService: RidersService) {
        self.ridersService = ridersService
    }
    
    func loadRiders() {
        ridersService.riders { [weak self] (riders, error) in
            if let _error = error {
                self?.output?.handle(error: _error)
            } else if let _riders = riders {
                self?.riders = _riders
                self?.output?.handleDidLoad(riders: _riders)
            }
        }
    }

    func detailedInfoAboutRiderInteractor(riderUid: String) -> DetailedInfoAboutRiderInteractor? {        
        if let selectedRider = riders.first(where: {$0.uid == riderUid}) {
            return DetailedInfoAboutRiderInteractorFactory.default(rider: selectedRider)
        } else {
            return nil
        }
    }
}


private final class TeamRidersInteractorImpl: RidersInteractor {
    weak var output: RidersInteractorOutput?
    
    private let team: Team
    private let ridersService: RidersService
    private var riders: [Rider] = []
    
    init(ridersService: RidersService, team: Team) {
        self.ridersService = ridersService
        self.team = team
    }
    
    func loadRiders() {
        ridersService.teamRiders(team: team) { [weak self] (riders, error) in
            if let _error = error {
                self?.output?.handle(error: _error)
            } else if let _riders = riders {
                self?.riders = _riders
                self?.output?.handleDidLoad(riders: _riders)
            }
        }
    }
    
    func detailedInfoAboutRiderInteractor(riderUid: String) -> DetailedInfoAboutRiderInteractor? {
        if let selectedRider = riders.first(where: {$0.uid == riderUid}) {
            return DetailedInfoAboutRiderInteractorFactory.default(rider: selectedRider)
        } else {
            return nil
        }
    }
}

// MARK: - Factory

final class RidersInteractorFactory {
    static func `default`(ridersService: RidersService = RidersServiceFactory.default()) -> RidersInteractor {
        return RidersInteractorImpl(ridersService: ridersService)
    }
    
    static func teamRiaders(ridersService: RidersService = RidersServiceFactory.default(), team: Team) -> RidersInteractor {
        return TeamRidersInteractorImpl(ridersService: ridersService, team: team)
    }
}
