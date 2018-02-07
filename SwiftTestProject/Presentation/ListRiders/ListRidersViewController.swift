//
//  ListRidersViewController.swift
//  SwiftTestProject
//
//  Created Dima Yarmolchuk on 2/4/18.
//  Copyright © 2018 Dima Yarmolchuk. All rights reserved.
//

import UIKit

// MARK: - Implementation

class ListRidersViewController: UIViewController, ListRidersPresenterOutput {
        
    fileprivate let presenter: ListRidersPresenter
    
    init(presenter: ListRidersPresenter) {
        self.presenter = presenter
        super.init(nibName: ListRidersViewController.className, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.handleViewIsReady()
    }
}

// MARK: - Factory

final class ListRidersViewControllerFactory {
    static func new(
        presenter: ListRidersPresenter
    ) -> ListRidersViewController {
        let controller = ListRidersViewController(presenter: presenter)
        presenter.output = controller
        return controller
    }
}
