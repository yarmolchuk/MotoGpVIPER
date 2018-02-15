//
//  TeamsService.swift
//  SwiftTestProject
//
//  Created by Dima Yarmolchuk on 2/12/18.
//  Copyright © 2018 Dima Yarmolchuk. All rights reserved.
//

import Foundation

// MARK: Protocol

protocol TeamsService {
    func teams(completion: @escaping (_ teams: [Team]?, _ error: Error?) -> Void)
}

// MARK: Implementation

private final class TeamsServiceImpl: TeamsService {

    private let apiRequestManager: AmazonApiRequestManager
    private let teamMapper: TeamMapper
    
    init(apiRequestManager: AmazonApiRequestManager, teamMapper: TeamMapper) {
        self.apiRequestManager = apiRequestManager
        self.teamMapper = teamMapper
    }

    func teams(completion: @escaping ([Team]?, Error?) -> Void) {
        apiRequestManager.teams{ [weak self] (response) in
            switch response {
            case .success(let data):
                completion(self?.teamMapper.map(data), nil)
            case .failure(let error):
                print(error)
            }
        }
    }
}

// MARK: Factory

final class TeamsServiceFactory {
    static func `default`(apiRequestManager: AmazonApiRequestManager = AmazonApiRequestManagerFactory.default(),
                          teamMapper: TeamMapper = TeamMapperFactory.default()) -> TeamsService {
        return TeamsServiceImpl(apiRequestManager: apiRequestManager, teamMapper: teamMapper)
    }
}
