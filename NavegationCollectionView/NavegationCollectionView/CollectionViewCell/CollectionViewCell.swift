//
//  CollectionViewCell.swift
//  NavegationCollectionView
//
//  Created by Lucas de Castro Souza on 17/03/22.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CollectionViewCell"
    
    @IBOutlet weak var carImage: UIImageView!
    @IBOutlet weak var carLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setup(title: String, image: String) {
        carLabel.text = title
        if let image = UIImage(named: image) {
            carImage.image = image
        }
    }

}
