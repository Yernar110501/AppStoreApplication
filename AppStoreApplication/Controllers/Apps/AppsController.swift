//
//  AppsController.swift
//  AppStoreApplication
//
//  Created by Yernar Baiginzheyev on 13.05.2024.
//

import UIKit

class AppsController: BaseListController {
    // MARK: - Properties
    let cellId = "cellID"
    // MARK: - Lyfecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .systemBackground
        collectionView.register(AppsGroupCell.self, forCellWithReuseIdentifier: AppsGroupCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    // MARK: - Helpers
    
    // MARK: - CollectionViewDelegate and DataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AppsGroupCell.identifier, for: indexPath) as? AppsGroupCell {
            return cell
        }
        return .init()
    }
    
}

extension AppsController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: view.frame.width, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        .init(top: 16, left: 0, bottom: 0, right: 0)
    }
}


