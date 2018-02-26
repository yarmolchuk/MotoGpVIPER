//
//  TeamsViewController.swift
//  SwiftTestProject
//
//  Created Dima Yarmolchuk on 2/12/18.
//  Copyright © 2018 Dima Yarmolchuk. All rights reserved.
//

import UIKit

// MARK: - Implementation

class TeamsViewController: UIViewController, TeamsPresenterOutput {
    
    fileprivate let presenter: TeamsPresenter
    @IBOutlet weak var tableView: UITableView!
    
    init(presenter: TeamsPresenter) {
        self.presenter = presenter
        super.init(nibName: TeamsViewController.className, bundle: nil)
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
        self.tableView .reloadData()
    }

    private func configureNavigationBar() {
        self.title = "Moto GP Teams"

        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Show all", style: .plain,
                                                            target: self, action: #selector(showAllRiders))
    }
    
    private func configureTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(TeamTableViewCell.nib(), forCellReuseIdentifier: TeamTableViewCell.reuseIdentifier())
    }
    
    @objc fileprivate func showAllRiders() {
        presenter.handleShowAllRiders()
    }
}

extension TeamsViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewModel = presenter.viewModels[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: TeamTableViewCell.reuseIdentifier(), for: indexPath) as! TeamTableViewCell
        cell.populate(with: viewModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.viewModels.count
    }
}

extension TeamsViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        presenter.handleViewModel(viewModel: presenter.viewModels[indexPath.row])
    }
}

// MARK: - Factory

final class TeamsViewControllerFactory {
    static func new(
        presenter: TeamsPresenter
    ) -> TeamsViewController {
        let controller = TeamsViewController(presenter: presenter)
        presenter.output = controller
        return controller
    }
}
