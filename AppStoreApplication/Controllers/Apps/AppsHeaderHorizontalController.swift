//
//  AppsHeaderHorizontalController.swift
//  AppStoreApplication
//
//  Created by Yernar Baiginzheyev on 19.05.2024.
//

import UIKit

class AppsHeaderHorizontalController: HorizontalSnappingController {
    // MARK: - Properties
    
    private var socialApps: [SocialApp] = []
    
    // MARK: - Lyfecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .systemBackground
        collectionView.register(AppsHeaderCollectionViewCell.self,
                                forCellWithReuseIdentifier: AppsHeaderCollectionViewCell.identifier)
        collectionView.contentInset = .init(top: 0,
                                            left: Constants.leftRightPadding,
                                            bottom: 0,
                                            right: Constants.leftRightPadding)
        
    }
    // MARK: - Delegate and Datasourse
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return socialApps.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AppsHeaderCollectionViewCell.identifier, for: indexPath) as? AppsHeaderCollectionViewCell {
            
            let socialApp = socialApps[indexPath.item]
            cell.configure(with: socialApp)
            
            
            return cell
        }
        
        return .init()
    }
    // MARK: - Helpers
    public func configure(with model: [SocialApp]) {
        self.socialApps = model
    }
    
}
// MARK: - AppsHeaderHorizontalController+UICollectionViewDelegateFlowLayout
extension AppsHeaderHorizontalController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - Constants.widthOfFirstItem, height: view.frame.height)
    }
}
