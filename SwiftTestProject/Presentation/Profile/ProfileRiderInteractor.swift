//
//  DetailedInfoAboutRiderInteractor.swift
//  SwiftTestProject
//
//  Created Dima Yarmolchuk on 2/11/18.
//  Copyright © 2018 Dima Yarmolchuk. All rights reserved.
//

import Foundation

// MARK: - Output

protocol ProfileRiderInteractorOutput: class {
    func handle(error: Error)
    func handleDidLoad(profile: Profile)
}

// MARK: - Protocol

protocol ProfileRiderInteractor: class {
    var output: ProfileRiderInteractorOutput? { get set }
    
    func loadProfileRider()
    func getRider() -> Rider
}

// MARK: - Implementation

private final class ProfileRiderInteractorImpl: ProfileRiderInteractor {
 
    weak var output: ProfileRiderInteractorOutput?
    private let ridersService: RidersService
    private var profile: Profile? = nil
    
    fileprivate var rider: Rider

    init(rider: Rider, ridersService: RidersService) {
        self.rider = rider
        self.ridersService = ridersService
    }
    
    func getRider() -> Rider {
        return rider
    }
    
    func loadProfileRider() {
        ridersService.profileRider(with: rider.uid) { [weak self] (profile, error) in
            if let _error = error {
                self?.output?.handle(error: _error)
            } else if let _profile = profile {
                self?.profile = _profile

                if let _profile = self?.profile {
                    self?.output?.handleDidLoad(profile: _profile)
                }
            }
        }
    }
}

// MARK: - Factory

final class ProfileRiderInteractorFactory {
    static func `default`(rider: Rider, ridersService: RidersService) -> ProfileRiderInteractor {
        return ProfileRiderInteractorImpl(rider: rider, ridersService: ridersService)
    }
}
