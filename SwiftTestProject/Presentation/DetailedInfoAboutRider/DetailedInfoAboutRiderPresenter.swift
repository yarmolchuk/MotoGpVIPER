//
//  DetailedInfoAboutRiderPresenter.swift
//  SwiftTestProject
//
//  Created Dima Yarmolchuk on 2/11/18.
//  Copyright © 2018 Dima Yarmolchuk. All rights reserved.
//

import Foundation

// MARK: - Output

protocol DetailedInfoAboutRiderPresenterOutput: class {}

// MARK: - Protocol

protocol DetailedInfoAboutRiderPresenter: class {
    var output: DetailedInfoAboutRiderPresenterOutput? { get set }
    
    func handleViewIsReady()
}

// MARK: - Implementation

private final class DetailedInfoAboutRiderPresenterImpl: DetailedInfoAboutRiderPresenter, DetailedInfoAboutRiderInteractorOutput {
    
    private let interactor: DetailedInfoAboutRiderInteractor
    private let router: DetailedInfoAboutRiderRouter
    weak var output: DetailedInfoAboutRiderPresenterOutput?
    
    init(
        interactor: DetailedInfoAboutRiderInteractor,
        router: DetailedInfoAboutRiderRouter
    ) {
        self.interactor = interactor
        self.router = router
    }
    
    func handleViewIsReady() {
        
    }
    
    func viewModel(rider: Rider) -> DetailInfoRiderViewModel {
        return DetailInfoRiderViewModelFactory.default(rider: rider)
    }
}

// MARK: - Factory

final class DetailedInfoAboutRiderPresenterFactory {
    static func `default`(
        interactor: DetailedInfoAboutRiderInteractor,
        router: DetailedInfoAboutRiderRouter
    ) -> DetailedInfoAboutRiderPresenter {
        let presenter = DetailedInfoAboutRiderPresenterImpl(
            interactor: interactor,
            router: router
        )
        interactor.output = presenter
        return presenter
    }
}
