//
//  ListRidersPresenter.swift
//  SwiftTestProject
//
//  Created Dima Yarmolchuk on 2/4/18.
//  Copyright © 2018 Dima Yarmolchuk. All rights reserved.
//

import Foundation

// MARK: - Output

protocol RidersPresenterOutput: class {
    func viewModelsDidUpdate()
}

// MARK: - Protocol

protocol RidersPresenter: class {
    var output: RidersPresenterOutput? { get set }
    var viewModels: [RiderTableViewCellViewModel] { get set }
    
    func handleViewIsReady()
    func handleViewModel(viewModel: RiderTableViewCellViewModel)
}

// MARK: - Implementation

private final class RidersPresenterImpl: RidersPresenter, RidersInteractorOutput {

    private let interactor: RidersInteractor
    private let router: RidersRouter
    weak var output: RidersPresenterOutput?

    var viewModels: [RiderTableViewCellViewModel] = []
    
    init(
        interactor: RidersInteractor,
        router: RidersRouter
    ) {
        self.interactor = interactor
        self.router = router
    }
    
    func handleViewIsReady() {
        interactor.loadRiders()
    }
    
    func handle(error: Error) {
        print(error)
    }

    func handleDidLoad(riders: [Rider]) {
        DispatchQueue.main.async {
            self.viewModels = self.riderViewModels(riders: riders)
            self.output?.viewModelsDidUpdate()
        }
    }
    
    func handleViewModel(viewModel: RiderTableViewCellViewModel) {
        guard let profileRiderInteractor = interactor.profileRiderInteractor(riderUid: viewModel.uid) else { return }
        let profileRiderRouter = router.profileRiderRouter()
        let profileRiderPresenter = ProfileRiderPresenterFactory.default(interactor: profileRiderInteractor, router: profileRiderRouter)
        
        router.routeToProfileRider(presenter: profileRiderPresenter)
    }
    
    private func riderViewModels(riders: [Rider]) -> [RiderTableViewCellViewModel] {
        return riders.map{ RiderTableViewCellViewModelFactory.default(name: $0.name, number: $0.number, urlPhoto: $0.photoUrl, uid: $0.uid) }
    }
}

// MARK: - Factory

final class RidersPresenterFactory {
    static func `default`(
        interactor: RidersInteractor = RidersInteractorFactory.default(),
        router: RidersRouter
    ) -> RidersPresenter {
        let presenter = RidersPresenterImpl(
            interactor: interactor,
            router: router
        )
        interactor.output = presenter
        return presenter
    }
}
