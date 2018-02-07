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
    
}

// MARK: - Implementation

private final class ListRidersRouterImpl: ListRidersRouter {
    
}

// MARK: - Factory

final class ListRidersRouterFactory {
    static func `default`(
        navigationController: UINavigationController
    ) -> ListRidersRouter {
        return ListRidersRouterImpl(
        )
    }
}
