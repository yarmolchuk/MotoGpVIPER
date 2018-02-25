//
//  BikeCell.swift
//  SwiftTestProject
//
//  Created by Dima Yarmolchuk on 2/23/18.
//Copyright © 2018 Dima Yarmolchuk. All rights reserved.
//

import UIKit

class BikeCell: UITableViewCell {
    
    @IBOutlet weak var bikeILabel: UILabel!
    
    func populate(with viewModel: BikeCellViewModel) {
        bikeILabel.text = viewModel.bike
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
    }
}
