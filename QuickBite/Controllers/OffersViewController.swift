//
//  OffersViewController.swift
//  QuickBite
//
//  Created by Parth Shah on 2023-12-10.
//



import UIKit

class OffersViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var collectionView: UICollectionView!

    // Your array of offers
    let offers: [Offer] = [
        Offer(title: "Offer 1", description: "Description for Offer 1", imageUrl: "Image 1"),
        Offer(title: "Offer 2", description: "Description for Offer 2", imageUrl: "Image 2"),
        Offer(title: "Offer 3", description: "Description for Offer 3", imageUrl: "Image")
        // Add more offers as needed
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.navigationItem.title = "Offers"
        // Set up collection view data source and delegate
        collectionView.dataSource = self
        collectionView.delegate = self

        // Register custom cell
        collectionView.register(OfferCollectionViewCell.nib, forCellWithReuseIdentifier: OfferCollectionViewCell.identifier)
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
//        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
//            flowLayout.scrollDirection = .horizontal
//            flowLayout.itemSize = CGSize(width: 100, height: 100)
//            flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
//            flowLayout.minimumInteritemSpacing = 10
//        }
        
       
    }

    // MARK: - UICollectionViewDataSource

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return offers.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OfferCollectionViewCell.identifier, for: indexPath) as? OfferCollectionViewCell else {
            return UICollectionViewCell()
        }

        let offer = offers[indexPath.item]
        cell.titleLabel.text = offer.title
        cell.descriptionLabel.text = offer.description
        cell.offerImageView.image = UIImage(named: offer.imageUrl)
        // Configure other cell properties

        return cell
    }

    // MARK: - UICollectionViewDelegate

    // Implement any delegate methods as needed
}

import Foundation

struct Offer {
    let title: String
    let description: String
    let imageUrl: String
    // Add other properties as needed
}
