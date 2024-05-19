//
//  AppsHorizontalController.swift
//  AppStoreApplication
//
//  Created by Yernar Baiginzheyev on 13.05.2024.
//

import UIKit

class AppsHorizontalController: BaseListController {
    // MARK: - Properties
    private var appGroup: AppGroup?
    // MARK: - Lyfecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .systemBackground
        collectionView.register(AppsRowCell.self, forCellWithReuseIdentifier: AppsRowCell.identifier)
        
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
    }
    // MARK: - CollectionViewDelegate and CollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return appGroup?.feed.results.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AppsRowCell.identifier, for: indexPath) as? AppsRowCell {
            let app = appGroup?.feed.results[indexPath.item]
            if let app {
                cell.configure(with: app)
            }
            return cell
        }
        
        return .init()
    }
    
    // MARK: - Helpers
    
    public func configure(with model: AppGroup) {
        self.appGroup = model
    }
}
// MARK: - AppsHorizontalController
extension AppsHorizontalController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let height = (view.frame.height - 2 * Constants.topBottomPadding - 2 * Constants.lineSpacing) / 3
        return .init(width: view.frame.width - 48,
                     height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, 
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return Constants.lineSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: Constants.topBottomPadding,
                     left: Constants.leftRightPadding,
                     bottom: Constants.topBottomPadding,
                     right: Constants.leftRightPadding)
    }
    
}


