//
//  ListRidersInteractor.swift
//  SwiftTestProject
//
//  Created Dima Yarmolchuk on 2/4/18.
//  Copyright © 2018 Dima Yarmolchuk. All rights reserved.
//

import Foundation

// MARK: - Output

protocol ListRidersInteractorOutput: class {
    func handle(error: Error)
    func handleDidLoad(riders: [Rider])
}

// MARK: - Protocol

protocol ListRidersInteractor: class {
    var output: ListRidersInteractorOutput? { get set }
    
    func loadRiders()
    func detailedInfoAboutRiderInteractor(riderUid: String) -> DetailedInfoAboutRiderInteractor?
}

// MARK: - Implementation

private final class ListRidersInteractorImpl: ListRidersInteractor {
    weak var output: ListRidersInteractorOutput?
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

// MARK: - Factory

final class ListRidersInteractorFactory {
    static func `default`(ridersService: RidersService = RidersServiceFactory.default()) -> ListRidersInteractor {
        return ListRidersInteractorImpl(ridersService: ridersService)
    }
}
