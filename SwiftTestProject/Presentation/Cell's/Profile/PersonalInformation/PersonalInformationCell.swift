//
//  PersonalInformationCell.swift
//  SwiftTestProject
//
//  Created by Dima Yarmolchuk on 2/23/18.
//Copyright © 2018 Dima Yarmolchuk. All rights reserved.
//

import UIKit

class PersonalInformationCell: UITableViewCell {
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!

    func populate(with viewModel: PersonalInformationCellViewModel) {
        weightLabel.text = viewModel.weight
        heightLabel.text = viewModel.height
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
}
