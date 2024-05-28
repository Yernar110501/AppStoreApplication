//
//  ReviewsController.swift
//  AppStoreApplication
//
//  Created by Yernar Baiginzheyev on 28.05.2024.
//

import UIKit

class ReviewsController: HorizontalSnappingController {
    // MARK: - Lyfecycle
    var reviews: Reviews?
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(ReviewCell.self, forCellWithReuseIdentifier: ReviewCell.identifier)
        collectionView.contentInset = .init(top: 0, left: 16, bottom: 0, right: 16)
    }
    
    // MARK: - DataSource+Delegate
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return reviews?.feed.entry.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReviewCell.identifier, for: indexPath) as? ReviewCell {
            if let review = reviews?.feed.entry[indexPath.item] {
                cell.configure(with: review)
                
            }
            return cell
        }
        return .init()
    }
    
    // MARK: - Helpers
    public func configure(with model: Reviews?) {
        self.reviews = model
    }
}

extension ReviewsController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 48, height: view.frame.height)
    }
}
