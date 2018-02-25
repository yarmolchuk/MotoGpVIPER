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

}

// MARK: Implementation

private class DetailsInfoCellViewModelImpl: DetailsInfoCellViewModel {

}

// MARK: Factory

class DetailsInfoCellViewModelFactory {
    static func `default`() -> DetailsInfoCellViewModel {
        return DetailsInfoCellViewModelImpl()
    }
}

