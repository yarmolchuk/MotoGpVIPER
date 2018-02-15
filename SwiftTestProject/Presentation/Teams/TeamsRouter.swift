//
//  TeamsRouter.swift
//  SwiftTestProject
//
//  Created Dima Yarmolchuk on 2/12/18.
//  Copyright © 2018 Dima Yarmolchuk. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Protocol

protocol TeamsRouter {
    func ridersRouter() -> RidersRouter
    func routeToListRiders(presenter: RidersPresenter)
}

// MARK: - Implementation

private final class TeamsRouterImpl: NavigationRouter, TeamsRouter {
    
    func ridersRouter() -> RidersRouter {
        return RidersRouterFactory.default(navigationController: navigationController)
    }
    
    func routeToListRiders(presenter: RidersPresenter) {
        let controller = RidersViewControllerFactory.new(presenter: presenter)
        navigationController.pushViewController(controller, animated: true)
    }
}

// MARK: - Factory

final class TeamsRouterFactory {
    static func `default`(
        navigationController: UINavigationController
    ) -> TeamsRouter {
        return TeamsRouterImpl(
            with: navigationController
        )
    }
}
