//
//  AppDelegateRouter.swift
//  SwiftTestProject
//
//  Created by Dima Yarmolchuk on 2/4/18.
//  Copyright © 2018 Dima Yarmolchuk. All rights reserved.
//

import UIKit

// MARK: Protocol

protocol AppDelegateRouter {
    func routeToListRiders()
}

// MARK: Implementation

private final class AppDelegateRouterImpl: AppDelegateRouter {
    
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func routeToListRiders() {
        let navigationController = UINavigationController()
        
        let router = TeamsRouterFactory.default(navigationController: navigationController)
        let presenter = TeamsPresenterFactory.default(router: router)
        let viewController = TeamsViewControllerFactory.new(presenter: presenter)
        
        navigationController.setViewControllers([viewController], animated: false)
        window.rootViewController = navigationController
    }
}

// MARK: Factory

final class AppDelegateRouterFactory {
    static func `default`(window: UIWindow) -> AppDelegateRouter {
        return AppDelegateRouterImpl(window: window)
    }
}
