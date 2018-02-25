//
//  DetailedInfoAboutRiderPresenter.swift
//  SwiftTestProject
//
//  Created Dima Yarmolchuk on 2/11/18.
//  Copyright © 2018 Dima Yarmolchuk. All rights reserved.
//

import Foundation

// MARK: - Output

protocol ProfileRiderPresenterOutput: class {
    func viewModelsDidUpdate()
}

// MARK: - Protocol

protocol ProfileRiderPresenter: class {
    var output: ProfileRiderPresenterOutput? { get set }
    var viewModels: [Any] { get set }
    
    func handleViewIsReady()
}

// MARK: - Implementation

private final class ProfileRiderPresenterImpl: ProfileRiderPresenter, ProfileRiderInteractorOutput {

    private let interactor: ProfileRiderInteractor
    private let router: ProfileRiderRouter
    weak var output: ProfileRiderPresenterOutput?
    
    var viewModels: [Any] = []
    
    init(
        interactor: ProfileRiderInteractor,
        router: ProfileRiderRouter
    ) {
        self.interactor = interactor
        self.router = router
    }
    
    func handleViewIsReady() {
        interactor.loadProfileRider()
    }
    
    func handle(error: Error) {
        print(error)
    }
    
    func handleDidLoad(profile: Profile) {
        DispatchQueue.main.async {
            self.viewModels = self.profileViewModels(profile: profile)
            self.output?.viewModelsDidUpdate()
        }
    }
    
    private func profileViewModels(profile: Profile) -> [Any] {
        var viewModelsForProfile : [Any] = []
        viewModelsForProfile.append(PhotoCellViewModelFactory.default(urlPhoto: profile.photoUrl))
        viewModelsForProfile.append(BikeCellViewModelFactory.default(bike: profile.bike))
        viewModelsForProfile.append(TeamCellViewModelFactory.default(team: profile.team))
        viewModelsForProfile.append(InfoCellViewModelFactory.default(placeOfBirth: profile.placeOfBirth, dateOfBirth: profile.dateOfBirth))
        
        return viewModelsForProfile
    }
}

// MARK: - Factory

final class ProfileRiderPresenterFactory {
    static func `default`(
        interactor: ProfileRiderInteractor,
        router: ProfileRiderRouter
    ) -> ProfileRiderPresenter {
        let presenter = ProfileRiderPresenterImpl(
            interactor: interactor,
            router: router
        )
        interactor.output = presenter
        return presenter
    }
}
