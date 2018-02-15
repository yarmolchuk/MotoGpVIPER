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
    
}

// MARK: - Implementation

private final class TeamsRouterImpl: NavigationRouter, TeamsRouter {
    
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
