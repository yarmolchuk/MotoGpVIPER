//
//  ListRidersPresenter.swift
//  SwiftTestProject
//
//  Created Dima Yarmolchuk on 2/4/18.
//  Copyright © 2018 Dima Yarmolchuk. All rights reserved.
//

import Foundation

// MARK: - Output

protocol ListRidersPresenterOutput: class {
    func viewModelsDidUpdate()
}

// MARK: - Protocol

protocol ListRidersPresenter: class {
    var output: ListRidersPresenterOutput? { get set }
    var viewModels: [RiderTableViewCellViewModel] { get set }
    
    func handleViewIsReady()
    func handleViewModel(viewModel: RiderTableViewCellViewModel)
}

// MARK: - Implementation

private final class ListRidersPresenterImpl: ListRidersPresenter, ListRidersInteractorOutput {

    private let interactor: ListRidersInteractor
    private let router: ListRidersRouter
    weak var output: ListRidersPresenterOutput?

    var viewModels: [RiderTableViewCellViewModel] = []
    
    init(
        interactor: ListRidersInteractor,
        router: ListRidersRouter
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
        guard let detailInteractor = interactor.detailedInfoAboutRiderInteractor(riderUid: viewModel.uid) else { return }
        let detailRouter = router.detailedInfoAboutRiderRouter()
        let detailPresenter = DetailedInfoAboutRiderPresenterFactory.default(interactor: detailInteractor, router: detailRouter)
        
        router.routeToDetailsRiderInfo(presenter: detailPresenter)
    }
    
    private func riderViewModels(riders: [Rider]) -> [RiderTableViewCellViewModel] {
        return riders.map{ RiderTableViewCellViewModelFactory.default(name: $0.name, number: "", urlPhoto: $0.photoUrl, uid: $0.uid) }
    }
}

// MARK: - Factory

final class ListRidersPresenterFactory {
    static func `default`(
        interactor: ListRidersInteractor = ListRidersInteractorFactory.default(),
        router: ListRidersRouter
    ) -> ListRidersPresenter {
        let presenter = ListRidersPresenterImpl(
            interactor: interactor,
            router: router
        )
        interactor.output = presenter
        return presenter
    }
}
