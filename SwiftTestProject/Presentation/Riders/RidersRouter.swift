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
    func profileRiderRouter() -> ProfileRiderRouter
    func routeToProfileRiderInfo(presenter: ProfileRiderPresenter)
}

// MARK: - Implementation

private final class RidersRouterImpl: NavigationRouter, RidersRouter {
    
    func profileRiderRouter() -> ProfileRiderRouter {
        return ProfileRiderRouterFactory.default(navigationController: navigationController)
    }
    
    func routeToProfileRiderInfo(presenter: ProfileRiderPresenter) {
        let controller = ProfileRiderViewControllerFactory.new(presenter: presenter)
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
