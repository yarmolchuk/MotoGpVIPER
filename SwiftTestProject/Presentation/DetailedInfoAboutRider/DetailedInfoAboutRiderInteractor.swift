//
//  DetailedInfoAboutRiderInteractor.swift
//  SwiftTestProject
//
//  Created Dima Yarmolchuk on 2/11/18.
//  Copyright © 2018 Dima Yarmolchuk. All rights reserved.
//

import Foundation

// MARK: - Output

protocol DetailedInfoAboutRiderInteractorOutput: class {}

// MARK: - Protocol

protocol DetailedInfoAboutRiderInteractor: class {
    var output: DetailedInfoAboutRiderInteractorOutput? { get set }

    func getRider() -> Rider
}

// MARK: - Implementation

private final class DetailedInfoAboutRiderInteractorImpl: DetailedInfoAboutRiderInteractor {
 
    weak var output: DetailedInfoAboutRiderInteractorOutput?
    fileprivate var rider: Rider
    
    init(rider: Rider) {
        self.rider = rider
    }
    
    func getRider() -> Rider {
        return rider
    }
}

// MARK: - Factory

final class DetailedInfoAboutRiderInteractorFactory {
    static func `default`(rider: Rider) -> DetailedInfoAboutRiderInteractor {
        return DetailedInfoAboutRiderInteractorImpl(rider: rider)
    }
}
