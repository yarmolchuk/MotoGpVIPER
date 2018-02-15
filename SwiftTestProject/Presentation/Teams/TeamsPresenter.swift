//
//  TeamsPresenter.swift
//  SwiftTestProject
//
//  Created Dima Yarmolchuk on 2/12/18.
//  Copyright © 2018 Dima Yarmolchuk. All rights reserved.
//

import Foundation

// MARK: - Output

protocol TeamsPresenterOutput: class {
    func viewModelsDidUpdate()
}

// MARK: - Protocol

protocol TeamsPresenter: class {
    var output: TeamsPresenterOutput? { get set }
    var viewModels: [TeamTableViewCellViewModel] { get set }
    
    func handleViewIsReady()
    func handleViewModel(viewModel: TeamTableViewCellViewModel)
}

// MARK: - Implementation

private final class TeamsPresenterImpl: TeamsPresenter, TeamsInteractorOutput {

    private let interactor: TeamsInteractor
    private let router: TeamsRouter
    weak var output: TeamsPresenterOutput?
    
    var viewModels: [TeamTableViewCellViewModel] = []
    
    init(
        interactor: TeamsInteractor,
        router: TeamsRouter
    ) {
        self.interactor = interactor
        self.router = router
    }
    
    func handleViewIsReady() {
        interactor.loadTeams()
    }
    
    func handle(error: Error) {
        print(error)
    }
    
    func handleDidLoad(teams: [Team]) {
        DispatchQueue.main.async {
            self.viewModels = self.teamViewModels(teams: teams)
            self.output?.viewModelsDidUpdate()
        }
    }
    
    func handleViewModel(viewModel: TeamTableViewCellViewModel) {
        guard let riderInteractor = interactor.ridersInteractor(teamUid: viewModel.uid) else { return }
        let riderRouter = router.ridersRouter()
        let riderPresenter = RidersPresenterFactory.default(interactor: riderInteractor, router: riderRouter)
        router.routeToListRiders(presenter: riderPresenter)
    }
    
    private func teamViewModels(teams: [Team]) -> [TeamTableViewCellViewModel] {
        return teams.map{ TeamTableViewCellViewModelFactory.default(name: $0.name, uid: $0.uid) }
    }
}

// MARK: - Factory

final class TeamsPresenterFactory {
    static func `default`(
        interactor: TeamsInteractor = TeamsInteractorFactory.default(),
        router: TeamsRouter
    ) -> TeamsPresenter {
        let presenter = TeamsPresenterImpl(
            interactor: interactor,
            router: router
        )
        interactor.output = presenter
        return presenter
    }
}
