//
//  CustomTableViewCell.swift
//  CocoaPodsApp
//
//  Created by Sandra Monteiro de Castro on 21/03/22.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    static let identifier = "CustomTableViewCell"

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var imageCellView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setup(title: String, companyName: String, imageUrl: String) {
        titleLabel.text = title
        companyLabel.text = companyName
        imageCellView.layer.cornerRadius = 30
        imageCellView.loadImage(from: imageUrl)
    }
    
}
