//
//  ListRidersViewController.swift
//  SwiftTestProject
//
//  Created Dima Yarmolchuk on 2/4/18.
//  Copyright © 2018 Dima Yarmolchuk. All rights reserved.
//

import UIKit

// MARK: - Implementation

class RidersViewController: UIViewController, RidersPresenterOutput {
    
    fileprivate let presenter: RidersPresenter
    @IBOutlet weak var ridersTableView: UITableView!
    
    init(presenter: RidersPresenter) {
        self.presenter = presenter
        super.init(nibName: RidersViewController.className, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureNavigationBar()
        configureTableView()
        presenter.handleViewIsReady()
    }
    
    func viewModelsDidUpdate() {
        self.ridersTableView.reloadData()
    }
    
    private func configureNavigationBar() {
        self.title = "Riders"
    }
    
    private func configureTableView() {
        ridersTableView.dataSource = self
        ridersTableView.delegate = self
        ridersTableView.register(RiderTableViewCell.nib(), forCellReuseIdentifier: RiderTableViewCell.reuseIdentifier())
    }
}

// MARK: - Extension

extension RidersViewController : UITableViewDataSource {

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewModel = presenter.viewModels[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: RiderTableViewCell.reuseIdentifier(), for: indexPath) as! RiderTableViewCell
        cell.populate(with: viewModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.viewModels.count
    }
}

extension RidersViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        presenter.handleViewModel(viewModel: presenter.viewModels[indexPath.row])
    }
}

// MARK: - Factory

final class RidersViewControllerFactory {
    static func new(
        presenter: RidersPresenter
    ) -> RidersViewController {
        let controller = RidersViewController(presenter: presenter)
        presenter.output = controller
        return controller
    }
}
