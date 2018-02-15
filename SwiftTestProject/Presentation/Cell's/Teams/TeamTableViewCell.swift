//
//  TeamTableViewCell.swift
//  SwiftTestProject
//
//  Created by Dima Yarmolchuk on 2/12/18.
//Copyright © 2018 Dima Yarmolchuk. All rights reserved.
//

import UIKit

class TeamTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!

    func populate(with viewModel: TeamTableViewCellViewModel) {
        nameLabel.text = viewModel.name
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
}
