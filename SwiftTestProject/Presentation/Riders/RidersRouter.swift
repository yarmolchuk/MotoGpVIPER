//
//  ListRidersRouter.swift
//  SwiftTestProject
//
//  Created Dima Yarmolchuk on 2/4/18.
//  Copyright © 2018 Dima Yarmolchuk. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Protocol

protocol RidersRouter {
    func detailedInfoAboutRiderRouter() -> DetailedInfoAboutRiderRouter
    func routeToDetailsRiderInfo(presenter: DetailedInfoAboutRiderPresenter)
}

// MARK: - Implementation

private final class RidersRouterImpl: NavigationRouter, RidersRouter {
    
    func detailedInfoAboutRiderRouter() -> DetailedInfoAboutRiderRouter {
        return DetailedInfoAboutRiderRouterFactory.default(navigationController: navigationController)
    }
    
    func routeToDetailsRiderInfo(presenter: DetailedInfoAboutRiderPresenter) {
        let controller = DetailedInfoAboutRiderViewControllerFactory.new(presenter: presenter)
        navigationController.pushViewController(controller, animated: true)
    }
}

// MARK: - Factory

final class RidersRouterFactory {
    static func `default`(
        navigationController: UINavigationController
    ) -> RidersRouter {
        return RidersRouterImpl(
            with: navigationController)
    }
}
