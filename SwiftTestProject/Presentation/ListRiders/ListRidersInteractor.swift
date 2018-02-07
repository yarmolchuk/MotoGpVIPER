//
//  ListRidersInteractor.swift
//  SwiftTestProject
//
//  Created Dima Yarmolchuk on 2/4/18.
//  Copyright © 2018 Dima Yarmolchuk. All rights reserved.
//

import Foundation

// MARK: - Output

protocol ListRidersInteractorOutput: class {}

// MARK: - Protocol

protocol ListRidersInteractor: class {
    var output: ListRidersInteractorOutput? { get set }
}

// MARK: - Implementation

private final class ListRidersInteractorImpl: ListRidersInteractor {
    weak var output: ListRidersInteractorOutput?
}

// MARK: - Factory

final class ListRidersInteractorFactory {
    static func `default`() -> ListRidersInteractor {
        return ListRidersInteractorImpl()
    }
}
