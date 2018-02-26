//
//  DetailsInfoCell.swift
//  SwiftTestProject
//
//  Created by Dima Yarmolchuk on 2/23/18.
//Copyright © 2018 Dima Yarmolchuk. All rights reserved.
//

import UIKit

class DetailsInfoCell: UITableViewCell {
    @IBOutlet weak var infoLabel: UILabel!
    
    func populate(with viewModel: DetailsInfoCellViewModel) {
        infoLabel.text = viewModel.info
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
}
