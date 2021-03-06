//
//  RiderTableViewCell.swift
//  SwiftTestProject
//
//  Created by Dima Yarmolchuk on 2/7/18.
//  Copyright © 2018 Dima Yarmolchuk. All rights reserved.
//

import UIKit

class RiderTableViewCell: UITableViewCell {
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    
    func populate(with viewModel: RiderTableViewCellViewModel) {
        nameLabel.text = viewModel.name
        numberLabel.text = viewModel.number
        photoImageView.image = nil
        
        getDataFromUrl(url: URL(string: viewModel.urlPhoto)!) { [weak self] (data, _, _) in
            if let _data = data {
                DispatchQueue.main.async {
                    self?.photoImageView.image = UIImage(data: _data)
                }
            }
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
}
