//
//  BaseListController.swift
//  AppStoreApplication
//
//  Created by Yernar Baiginzheyev on 13.05.2024.
//

import UIKit

class BaseListController: UICollectionViewController {
    // MARK: - Init
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
