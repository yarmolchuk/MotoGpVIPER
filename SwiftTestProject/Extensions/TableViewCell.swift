//
//  TableViewCell.swift
//  SwiftTestProject
//
//  Created by Dima Yarmolchuk on 2/23/18.
//  Copyright © 2018 Dima Yarmolchuk. All rights reserved.
//

import UIKit

extension UITableViewCell {
    func getDataFromUrl(url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            completion(data, response, error)
        }.resume()
    }
    
    static func nib() -> UINib {
        return UINib(nibName: self.className, bundle: nil)
    }
    
    static func reuseIdentifier() -> String {
        return className
    }
}
