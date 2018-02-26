//
//  DetailsInfoCellViewModel.swift
//  SwiftTestProject
//
//  Created by Dima Yarmolchuk on 2/23/18.
//Copyright © 2018 Dima Yarmolchuk. All rights reserved.
//

import Foundation

// MARK: Protocol

protocol DetailsInfoCellViewModel {
    var info: String { get }
}

// MARK: Implementation

private class DetailsInfoCellViewModelImpl: DetailsInfoCellViewModel {
    let info: String
    
    init(info: String) {
        self.info = info
    }
}

// MARK: Factory

class DetailsInfoCellViewModelFactory {
    static func `default`(info: String) -> DetailsInfoCellViewModel {
        return DetailsInfoCellViewModelImpl(info: info)
    }
}

