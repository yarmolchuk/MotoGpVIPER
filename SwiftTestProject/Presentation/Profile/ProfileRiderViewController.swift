//
//  DetailedInfoAboutRiderViewController.swift
//  SwiftTestProject
//
//  Created Dima Yarmolchuk on 2/11/18.
//  Copyright © 2018 Dima Yarmolchuk. All rights reserved.
//

import UIKit

// MARK: - Implementation

class ProfileRiderViewController: UIViewController, ProfileRiderPresenterOutput {

    fileprivate let presenter: ProfileRiderPresenter
    @IBOutlet weak var tableView: UITableView!
    
    init(presenter: ProfileRiderPresenter) {
        self.presenter = presenter
        super.init(nibName: ProfileRiderViewController.className, bundle: nil)
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
    
    private func configureNavigationBar() {
        self.title = "Info Rider"
    }
    
    func viewModelsDidUpdate() {
        self.tableView.reloadData()
    }
    
    private func configureTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "PhotoCell", bundle: nil),
                                 forCellReuseIdentifier: "PhotoCellIdentifier")
        
        tableView.register(UINib(nibName: "BikeCell", bundle: nil),
                           forCellReuseIdentifier: "BikeCellIdentifier")
        
        tableView.register(UINib(nibName: "TeamCell", bundle: nil),
                           forCellReuseIdentifier: "TeamCellIdentifier")
        
        tableView.register(UINib(nibName: "InfoCell", bundle: nil),
                           forCellReuseIdentifier: "InfoCellIdentifier")
    }
}

// MARK: - Extension

extension ProfileRiderViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        switch presenter.viewModels[indexPath.row] {
        case is PhotoCellViewModel:
            let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoCellIdentifier", for: indexPath) as! PhotoCell
            cell.populate(with: presenter.viewModels[indexPath.row] as! PhotoCellViewModel)
            return cell
        case is BikeCellViewModel:
            let cell = tableView.dequeueReusableCell(withIdentifier: "BikeCellIdentifier", for: indexPath) as! BikeCell
            cell.populate(with: presenter.viewModels[indexPath.row] as! BikeCellViewModel)
            return cell
        case is TeamCellViewModel:
            let cell = tableView.dequeueReusableCell(withIdentifier: "TeamCellIdentifier", for: indexPath) as! TeamCell
            cell.populate(with: presenter.viewModels[indexPath.row] as! TeamCellViewModel)
            return cell
        case is InfoCellViewModel:
            let cell = tableView.dequeueReusableCell(withIdentifier: "InfoCellIdentifier", for: indexPath) as! InfoCell
            cell.populate(with: presenter.viewModels[indexPath.row] as! InfoCellViewModel)
            return cell
        default:
            return tableView.dequeueReusableCell(withIdentifier: "", for: indexPath) 
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.viewModels.count
    }
}

extension ProfileRiderViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - Factory

final class ProfileRiderViewControllerFactory {
    static func new(
        presenter: ProfileRiderPresenter
    ) -> ProfileRiderViewController {
        let controller = ProfileRiderViewController(presenter: presenter)
        presenter.output = controller
        return controller
    }
}
