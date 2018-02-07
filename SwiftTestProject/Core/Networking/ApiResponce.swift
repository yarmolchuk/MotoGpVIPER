//
//  ApiResponce.swift
//  SwiftTestProject
//
//  Created by Dima Yarmolchuk on 2/6/18.
//  Copyright © 2018 Dima Yarmolchuk. All rights reserved.
//

import Foundation

public enum ApiResponce
{
    case success(Data)
    case failure(Error)
    
    public var isSuccess: Bool {
        switch self {
        case .success: return true
        case .failure: return false
        }
    }
    public var value: Data? {
        switch self {
        case .success(let value): return value
        case .failure: return nil
        }
    }
    public var error: Error? {
        switch self {
        case .success: return nil
        case .failure(let error): return error
        }
    }
}
