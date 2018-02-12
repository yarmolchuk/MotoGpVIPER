//
//  DetailedInfoAboutRiderViewController.swift
//  SwiftTestProject
//
//  Created Dima Yarmolchuk on 2/11/18.
//  Copyright © 2018 Dima Yarmolchuk. All rights reserved.
//

import UIKit

// MARK: - Implementation

class DetailedInfoAboutRiderViewController: UIViewController, DetailedInfoAboutRiderPresenterOutput {
        
    fileprivate let presenter: DetailedInfoAboutRiderPresenter
    
    init(presenter: DetailedInfoAboutRiderPresenter) {
        self.presenter = presenter
        super.init(nibName: DetailedInfoAboutRiderViewController.className, bundle: nil)
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

final class DetailedInfoAboutRiderViewControllerFactory {
    static func new(
        presenter: DetailedInfoAboutRiderPresenter
    ) -> DetailedInfoAboutRiderViewController {
        let controller = DetailedInfoAboutRiderViewController(presenter: presenter)
        presenter.output = controller
        return controller
    }
}
