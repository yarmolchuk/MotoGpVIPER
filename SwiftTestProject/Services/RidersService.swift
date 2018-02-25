//
//  RidersService.swift
//  SwiftTestProject
//
//  Created by Dima Yarmolchuk on 2/4/18.
//  Copyright © 2018 Dima Yarmolchuk. All rights reserved.
//

import Foundation

// MARK: Protocol

protocol RidersService {
    func riders(completion: @escaping (_ riders: [Rider]?, _ error: Error?) -> Void)
    func teamRiders(team: Team, completion: @escaping ([Rider]?, Error?) -> Void)
    func profileRider(with uid: String, completion: @escaping (_ profile: Profile?, _ error: Error?) -> Void)
}

// MARK: Implementation

private final class RidersServiceImpl: RidersService {
    
    private let apiRequestManager: AmazonApiRequestManager
    private let riderMapper: RiderMapper
    private let profileMapper: ProfileMapper
    
    init(apiRequestManager: AmazonApiRequestManager, riderMapper: RiderMapper, profileMapper: ProfileMapper) {
        self.apiRequestManager = apiRequestManager
        self.riderMapper = riderMapper
        self.profileMapper = profileMapper
    }
    
    func riders(completion: @escaping ([Rider]?, Error?) -> Void) {
        apiRequestManager.riders{ [weak self] (response) in
            switch response {
            case .success(let data):
                completion(self?.riderMapper.map(data), nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    
    func teamRiders(team: Team, completion: @escaping ([Rider]?, Error?) -> Void) {
        apiRequestManager.riders{ [weak self] (response) in
            switch response {
            case .success(let data):
                if let riders = self?.riderMapper.map(data) {
                    completion(riders.filter{$0.teamUid == team.uid}, nil)
                }
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    
    func profileRider(with uid: String, completion: @escaping (Profile?, Error?) -> Void) {
        apiRequestManager.profile(with: uid) { [weak self] (response) in
            switch response {
            case .success(let data):
                if let _profile = self?.profileMapper.map(data) {
                    completion(_profile, nil)
                }
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
}

// MARK: Factory

final class RidersServiceFactory {
    static func `default`(apiRequestManager: AmazonApiRequestManager = AmazonApiRequestManagerFactory.default(),
                          riderMapper: RiderMapper = RiderMapperFactory.default(),
                          profileMapper: ProfileMapper = ProfileMapperFactory.default()) -> RidersService {
        return RidersServiceImpl(apiRequestManager: apiRequestManager, riderMapper: riderMapper, profileMapper: profileMapper)
    }
}

