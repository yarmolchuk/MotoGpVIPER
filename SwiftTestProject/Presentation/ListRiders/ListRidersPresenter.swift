//
//  ListRidersPresenter.swift
//  SwiftTestProject
//
//  Created Dima Yarmolchuk on 2/4/18.
//  Copyright © 2018 Dima Yarmolchuk. All rights reserved.
//

import Foundation

// MARK: - Output

protocol ListRidersPresenterOutput: class {}

// MARK: - Protocol

protocol ListRidersPresenter: class {
    var output: ListRidersPresenterOutput? { get set }
    
    func handleViewIsReady()
}

// MARK: - Implementation

private final class ListRidersPresenterImpl: ListRidersPresenter, ListRidersInteractorOutput {
    
    private let interactor: ListRidersInteractor
    private let router: ListRidersRouter
    weak var output: ListRidersPresenterOutput?
    
    init(
        interactor: ListRidersInteractor,
        router: ListRidersRouter
    ) {
        self.interactor = interactor
        self.router = router
    }
    
    func handleViewIsReady() {
        
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
