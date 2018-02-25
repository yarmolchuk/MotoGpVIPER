//
//  PhotoCellViewModel.swift
//  SwiftTestProject
//
//  Created by Dima Yarmolchuk on 2/23/18.
//Copyright © 2018 Dima Yarmolchuk. All rights reserved.
//

import Foundation

// MARK: Protocol

protocol PhotoCellViewModel {
    var urlPhoto: String { get }
}

// MARK: Implementation

private class PhotoCellViewModelImpl: PhotoCellViewModel {
    let urlPhoto: String
    
    init(urlPhoto: String) {
        self.urlPhoto = urlPhoto
    }
}

// MARK: Factory

class PhotoCellViewModelFactory {
    static func `default`(urlPhoto: String) -> PhotoCellViewModel {
        return PhotoCellViewModelImpl(urlPhoto: urlPhoto)
    }
}

