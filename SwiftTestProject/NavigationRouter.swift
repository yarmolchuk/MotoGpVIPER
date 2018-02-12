//
//  NavigationRouter.swift
//  SwiftTestProject
//
//  Created by Dima Yarmolchuk on 2/11/18.
//  Copyright © 2018 Dima Yarmolchuk. All rights reserved.
//

import UIKit

class NavigationRouter: NSObject {
    
    let navigationController: UINavigationController
    
    init(with navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}
