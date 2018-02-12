//
//  DetailedInfoAboutRiderRouter.swift
//  SwiftTestProject
//
//  Created Dima Yarmolchuk on 2/11/18.
//  Copyright © 2018 Dima Yarmolchuk. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Protocol

protocol DetailedInfoAboutRiderRouter {
    
}

// MARK: - Implementation

private final class DetailedInfoAboutRiderRouterImpl: DetailedInfoAboutRiderRouter {
    
}

// MARK: - Factory

final class DetailedInfoAboutRiderRouterFactory {
    static func `default`(
        navigationController: UINavigationController
    ) -> DetailedInfoAboutRiderRouter {
        return DetailedInfoAboutRiderRouterImpl(
        )
    }
}
