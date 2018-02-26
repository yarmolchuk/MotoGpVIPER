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
        
        tableView.register(PhotoCell.nib(), forCellReuseIdentifier: PhotoCell.reuseIdentifier())
        tableView.register(BikeCell.nib(), forCellReuseIdentifier: BikeCell.reuseIdentifier())
        tableView.register(TeamCell.nib(), forCellReuseIdentifier: TeamCell.reuseIdentifier())
        tableView.register(InfoCell.nib(), forCellReuseIdentifier: InfoCell.reuseIdentifier())
        tableView.register(PersonalInformationCell.nib(), forCellReuseIdentifier: PersonalInformationCell.reuseIdentifier())
        tableView.register(DetailsInfoCell.nib(), forCellReuseIdentifier: DetailsInfoCell.reuseIdentifier())
    }
}

// MARK: - Extension

extension ProfileRiderViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch presenter.viewModels[indexPath.row] {
        case is PhotoCellViewModel:
            let cell = tableView.dequeueReusableCell(withIdentifier: PhotoCell.reuseIdentifier(), for: indexPath) as! PhotoCell
            cell.populate(with: presenter.viewModels[indexPath.row] as! PhotoCellViewModel)
            return cell
        case is BikeCellViewModel:
            let cell = tableView.dequeueReusableCell(withIdentifier: BikeCell.reuseIdentifier(), for: indexPath) as! BikeCell
            cell.populate(with: presenter.viewModels[indexPath.row] as! BikeCellViewModel)
            return cell
        case is TeamCellViewModel:
            let cell = tableView.dequeueReusableCell(withIdentifier: TeamCell.reuseIdentifier(), for: indexPath) as! TeamCell
            cell.populate(with: presenter.viewModels[indexPath.row] as! TeamCellViewModel)
            return cell
        case is InfoCellViewModel:
            let cell = tableView.dequeueReusableCell(withIdentifier: InfoCell.reuseIdentifier(), for: indexPath) as! InfoCell
            cell.populate(with: presenter.viewModels[indexPath.row] as! InfoCellViewModel)
            return cell
        case is PersonalInformationCellViewModel:
            let cell = tableView.dequeueReusableCell(withIdentifier: PersonalInformationCell.reuseIdentifier(), for: indexPath) as! PersonalInformationCell
            cell.populate(with: presenter.viewModels[indexPath.row] as! PersonalInformationCellViewModel)
            return cell
        case is DetailsInfoCellViewModel:
            let cell = tableView.dequeueReusableCell(withIdentifier: DetailsInfoCell.reuseIdentifier(), for: indexPath) as! DetailsInfoCell
            cell.populate(with: presenter.viewModels[indexPath.row] as! DetailsInfoCellViewModel)
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
    static func new (
        presenter: ProfileRiderPresenter
    ) -> ProfileRiderViewController {
        let controller = ProfileRiderViewController(presenter: presenter)
        presenter.output = controller
        return controller
    }
}
