//
//  InfoCell.swift
//  SwiftTestProject
//
//  Created by Dima Yarmolchuk on 2/23/18.
//Copyright © 2018 Dima Yarmolchuk. All rights reserved.
//

import UIKit

class InfoCell: UITableViewCell {
    @IBOutlet weak var placeOfBirthLabel: UILabel!
    @IBOutlet weak var dateOfBirthLabel: UILabel!
    
    func populate(with viewModel: InfoCellViewModel) {
        self.placeOfBirthLabel.text = viewModel.placeOfBirth
        self.dateOfBirthLabel.text = viewModel.dateOfBirth
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
    }
}
