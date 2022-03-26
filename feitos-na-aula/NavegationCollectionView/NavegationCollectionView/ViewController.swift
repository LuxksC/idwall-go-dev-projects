//
//  ViewController.swift
//  NavegationCollectionView
//
//  Created by Lucas de Castro Souza on 17/03/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collection: UICollectionView!
    
    let cars: [Cars] = [Cars(image: "bmw", name: "BMW Série 3"),
                    Cars(image: "ferrari", name: "Ferrari"),
                    Cars(image: "camaro", name: "Chevrolet Camaro") ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configCollectionView()
    }

    // MARK: - Private Methods
    private func configCollectionView () {
        // INITIALIZING PROTOCOLS
        collection.delegate = self
        collection.dataSource = self
        
        //REGISTER OUTSIDE CELL
        let nib = UINib(nibName: CollectionViewCell.identifier, bundle: nil)
        collection.register(nib, forCellWithReuseIdentifier: CollectionViewCell.identifier)
        
        //DEFINE CELL LAYOUT SIZE
        let windowWidth = view.frame.size.width
        let cardWidth = (windowWidth-16-32)/2
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: cardWidth, height: 200) //cell width and height
        layout.minimumInteritemSpacing = 16 //minimun horizontal spacing beetween items
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 16 //minimun vertical spacing beetween items
        
        collection.collectionViewLayout = layout
    }
    
}

extension ViewController: UICollectionViewDelegate {}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cars.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as? CollectionViewCell else {return UICollectionViewCell()}
        
        let car = cars[indexPath.row]
        
        cell.setup(title: car.name, image: car.image)
        
        return cell
    }
}

