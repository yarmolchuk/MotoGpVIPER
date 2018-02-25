//
//  PhotoCell.swift
//  SwiftTestProject
//
//  Created by Dima Yarmolchuk on 2/23/18.
//Copyright © 2018 Dima Yarmolchuk. All rights reserved.
//

import UIKit

class PhotoCell: UITableViewCell {
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    func populate(with viewModel: PhotoCellViewModel) {
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
