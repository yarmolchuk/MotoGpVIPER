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

protocol ProfileRiderRouter {
    
}

// MARK: - Implementation

private final class ProfileRiderRouterImpl: ProfileRiderRouter {
    
}

// MARK: - Factory

final class ProfileRiderRouterFactory {
    static func `default`(
        navigationController: UINavigationController
    ) -> ProfileRiderRouter {
        return ProfileRiderRouterImpl(
        )
    }
}
