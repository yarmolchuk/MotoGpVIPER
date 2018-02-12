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

protocol ListRidersRouter {
    func detailedInfoAboutRiderRouter() -> DetailedInfoAboutRiderRouter
    func routeToDetailsRiderInfo(presenter: DetailedInfoAboutRiderPresenter)
}

// MARK: - Implementation

private final class ListRidersRouterImpl: NavigationRouter, ListRidersRouter {
    
    func detailedInfoAboutRiderRouter() -> DetailedInfoAboutRiderRouter {
        return DetailedInfoAboutRiderRouterFactory.default(navigationController: navigationController)
    }
    
    func routeToDetailsRiderInfo(presenter: DetailedInfoAboutRiderPresenter) {
        let controller = DetailedInfoAboutRiderViewControllerFactory.new(presenter: presenter)
        navigationController.pushViewController(controller, animated: true)
    }
}

// MARK: - Factory

final class ListRidersRouterFactory {
    static func `default`(
        navigationController: UINavigationController
    ) -> ListRidersRouter {
        return ListRidersRouterImpl(
            with: navigationController)
    }
}
