//
//  TeamCell.swift
//  SwiftTestProject
//
//  Created by Dima Yarmolchuk on 2/25/18.
//Copyright © 2018 Dima Yarmolchuk. All rights reserved.
//

import UIKit

class TeamCell: UITableViewCell {
    @IBOutlet weak var teamILabel: UILabel!

    func populate(with viewModel: TeamCellViewModel) {
        teamILabel.text = viewModel.team
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
    }
}
