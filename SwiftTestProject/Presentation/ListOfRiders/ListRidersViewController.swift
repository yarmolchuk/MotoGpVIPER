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
    @IBOutlet weak var ridersTableView: UITableView!
    
    init(presenter: ListRidersPresenter) {
        self.presenter = presenter
        super.init(nibName: ListRidersViewController.className, bundle: nil)
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
        ridersTableView.register(UINib(nibName: "RiderTableViewCell", bundle: nil),
                                 forCellReuseIdentifier: "RiderTableViewCellIdentifier")
    }
}

extension ListRidersViewController : UITableViewDataSource {

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewModel = presenter.viewModels[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "RiderTableViewCellIdentifier", for: indexPath) as! RiderTableViewCell
        cell.populate(with: viewModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.viewModels.count
    }
}

extension ListRidersViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.handleViewModel(viewModel: presenter.viewModels[indexPath.row])
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
