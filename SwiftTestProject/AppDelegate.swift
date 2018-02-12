//
//  AppDelegate.swift
//  SwiftTestProject
//
//  Created by Dima Yarmolchuk on 2/4/18.
//  Copyright © 2018 Dima Yarmolchuk. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    var interactor: AppDelegateInteractor!
    var router: AppDelegateRouter!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        
        configureHttpRequestСache()
        
        if let _window = window {
            router = AppDelegateRouterFactory.default(window: _window)
            router.routeToListRiders()
        }
        
        return true
    }
    
    private func configureHttpRequestСache() {
        let cacheSize = 50*1024*1024
        let cacheDiskSize = 50*1024*1024
        let requestCache = URLCache(memoryCapacity: cacheSize, diskCapacity: cacheDiskSize, diskPath: "cachedHttpRequest")
        URLCache.shared = requestCache
    }
}

