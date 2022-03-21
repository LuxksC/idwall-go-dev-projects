//
//  CustomTableViewCell.swift
//  NavigationTableView
//
//  Created by Sandra Monteiro de Castro on 15/03/22.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    static let identifier = "CustomTableViewCell"

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageCellView: UIImageView!
    
    func setup(title: String, image: String) {
        titleLabel.text = title
        if let image = UIImage(named: image) {
            imageCellView.image = image
        }
    }
    
}
