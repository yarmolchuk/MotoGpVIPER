//
//  AppDelegateInteractor.swift
//  SwiftTestProject
//
//  Created by Dima Yarmolchuk on 2/4/18.
//  Copyright © 2018 Dima Yarmolchuk. All rights reserved.
//

import Foundation

// MARK: Protocol

protocol AppDelegateInteractor {

}

// MARK: Implementation

private final class AppDelegateInteractorImpl: AppDelegateInteractor {

}

// MARK: Factory

final class AppDelegateInteractorFactory {
    static func `default`() -> AppDelegateInteractor {
        return AppDelegateInteractorImpl()
    }
}
